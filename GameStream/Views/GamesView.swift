//
//  GamesView.swift
//  GameStream
//
//  Created by Jose Daniel Corredor Zambrano on 26/07/22.
//

import SwiftUI
import Kingfisher

struct GamesView: View {
    
    //Se suscribe a un bjeto que "emite" o que permite suscribirse a cambios
    @ObservedObject var allTheVideoGames = ViewModel()
    
    @State var gameviewIsActive: Bool = false
    @State var url:String = ""
    @State var titulo:String = ""
    @State var studio:String = ""
    @State var calificacion: String = ""
    @State var anoPublicacion: String = ""
    @State var descripcion:String = ""
    @State var tags:[String] = [""]
    @State var imgsUrl: [String] = [""]
    
    
    let formaGrid = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ZStack{
            
            Color("background").ignoresSafeArea()
            
            VStack{
                
                Text("Games")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 16, leading: 0, bottom: 64, trailing: 0))
                
                
                ScrollView{
                    
                    LazyVGrid(columns: formaGrid, spacing: 8){
                        
                        ForEach(allTheVideoGames.gamesInfo, id: \.self){
                            
                            game in
                            
                            Button(action: {
                                
                                
                                url = game.videosUrls.mobile
                                titulo = game.title
                                studio = game.studio
                                calificacion = game.contentRaiting
                                anoPublicacion = game.publicationYear
                                descripcion  = game.description
                                tags = game.tags
                                imgsUrl = game.galleryImages
                                
                                gameviewIsActive = true
                                
                            }, label: {
//                                Text("\(game.title)")
                                KFImage(URL(string: game.galleryImages[0])!)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(RoundedRectangle.init(cornerRadius: 4))
                                    .padding(.bottom, 12)
                            })
                        }
                    }
                }
                
                
            }.padding(.horizontal, 6.0)
            
            
            NavigationLink(isActive: $gameviewIsActive, destination: {GameView(url: url, titulo: titulo, studio: studio, calificacion: calificacion, anoPublicacion: anoPublicacion, descripcion: descripcion, tags: tags, imgsUrl: imgsUrl)}, label: {
                EmptyView()
            })
            
        }.navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .onAppear(
                //Todo lo que este aca va a ejecutarse mientras se genera la vista de donde esta esto
                perform: {
                    print("primer elemento JSON")
                    
//                    print("Primer elemento del JSON: \(allTheVideoGames.gamesInfo[0])")
//                    print("Titulo del primer videogame: \(allTheVideoGames.gamesInfo[0].title)")
                }
                
            
            )
    }
}

struct GamesView_Previews: PreviewProvider {
    static var previews: some View {
        GamesView()
    }
}
