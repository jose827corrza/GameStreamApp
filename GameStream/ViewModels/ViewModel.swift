//
//  ViewModel.swift
//  GameStream
//
//  Created by Jose Daniel Corredor Zambrano on 26/07/22.
//

import Foundation


class ViewModel : ObservableObject {
    
    @Published var gamesInfo = [Game]()
    
    init(){
        
        let url = URL(string: "https://gamestream-api.herokuapp.com/api/games")!
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            do{
                if let jsonData = data{
                    
                    print("tamano del JSON es: \(jsonData)")
                    
                    let decoder = JSONDecoder()
                    let decodeData = try
                        decoder.decode([Game].self, from: jsonData)
                    
                    
                    //Importante, aca se usa otro hilo para que no bloquee la visualizacion
                    DispatchQueue.main.async {
                        self.gamesInfo.append(contentsOf: decodeData)
                    }
                }
            }catch{
                print("Hubo un error: \(error)")
            }
            
        }.resume() //Cuidado, esto es para que se ejecute!!!
    }
}
