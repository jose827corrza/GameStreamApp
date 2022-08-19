//
//  SearchGame.swift
//  GameStream
//
//  Created by Jose Daniel Corredor Zambrano on 13/08/22.
//

import Foundation

class SearchGame: ObservableObject {
    
    @Published var gameInfo = [Game]()
    
    func search(serachGame: String) {
        
        gameInfo.removeAll() // Borra busquedas anteriores
        
        //Aca permite meter valores con espacios en los query
        //let gameNamesSpaces = gameInfo.description.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        let gameNamesSpaces = serachGame.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = URL(string: "https://gamestream-api.herokuapp.com/api/games/search?contains=\(gameNamesSpaces ?? "cuphead")")!
        
        var request = URLRequest(url: url)
        print(url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            do{
                if let jsonData = data{
                    
                    print("tamano del JSON es: \(jsonData)")
                    
                    let decoder = JSONDecoder()
                    let decodeData = try
                        decoder.decode(Results.self, from: jsonData)
                    
                    
                    //Importante, aca se usa otro hilo para que no bloquee la visualizacion
                    DispatchQueue.main.async {
                        self.gameInfo.append(contentsOf: decodeData.results)
                    }
                }
            }catch{
                print("Hubo un error: \(error)")
            }
            
        }.resume() //Cuidado, esto es para que se ejecute!!!
        
        
    }
}
