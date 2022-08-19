//
//  HomeView.swift
//  GameStream
//
//  Created by Jose Daniel Corredor Zambrano on 25/07/22.
//

import SwiftUI
import AVKit
import Kingfisher

struct HomeView: View {
    @State private var selectedTag: Int = 2
    
    //Se usa  init por que proviene de UIKit
    init(){
        UITabBar.appearance().backgroundColor = UIColor(Color("tab-color"))
        UITabBar.appearance().isTranslucent = true
        
        print("Iniciando pantalla home")
    }
    var body: some View {
        TabView(selection: $selectedTag){
            
            
            ProfileView()
                .tabItem({
                    Image(systemName: "person")
                    Text("Profile")
                }).tag(0)
            GamesView()
                .tabItem({
                    Image(systemName: "gamecontroller")
                    Text("Games")
                }).tag(1)
            PantallaHome()
                .tabItem({
                    Image(systemName: "house")
                    Text("Home")
                }).tag(2)
            FavoriteView()
                .tabItem({
                    Image(systemName: "heart")
                    Text("Favourites")
                }).tag(3)
        }.accentColor(Color.white)
        
    }
}


struct PantallaHome: View {
    
    var body: some View {
        ZStack {
            Color("background").ignoresSafeArea()
            
            VStack{
                
                Image("applogo").resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250).padding(.horizontal, 11.0)
                
                
                
                SubHomeModule()
            }
            
            
            
            
        }.navigationBarHidden(true)
         .navigationBarBackButtonHidden(true)
        
        
    }
}

struct SubHomeModule: View {
    @State private var searchText: String = ""
    @State private var isGameInfoEmpty = false
    @State private var isGameViewActive = false
    @ObservedObject var gameFound = SearchGame()
    
    
    
    @State var url:String = ""
    @State var titulo:String = ""
    @State var studio:String = ""
    @State var calificacion: String = ""
    @State var anoPublicacion: String = ""
    @State var descripcion:String = ""
    @State var tags:[String] = [""]
    @State var imgsUrl: [String] = [""]
    @State var url2 = "https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4"
        @State var isPlayerActive = false
        let urlVideos:[String] = ["https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256671638/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256720061/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256814567/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256705156/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256801252/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256757119/movie480.mp4"]
    var body: some View{
        VStack {
            
            HStack{
                Button(action: {searchGame(name: searchText)}, label: {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(searchText.isEmpty ? Color.yellow : Color("dark-cian"))
                }).alert(isPresented: $isGameInfoEmpty, content: {
                    Alert(title: Text("Type something"), message: Text("You haven't typed any game"), dismissButton: .default(Text("Got it")))
                })
                
                ZStack(alignment: .leading){
                    if searchText.isEmpty {
                        Text("Search for a video").foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0))
                    }
                    TextField("", text: $searchText)
                        .foregroundColor(.white)
                }
                
                
            }.padding([.top, .leading, .bottom], 5.0)
             .background(Color("blue-ray"))
             .clipShape(Capsule())
            
            Text("Most Popular")
                .font(.title3)
                .foregroundColor(.white)
                .bold()
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                .padding(.top)
            
            ZStack{
                
                Button(action: {
                    url = urlVideos[0]
                    print("playing \(url)")
                    isPlayerActive = true
                }, label: {
                    
                    VStack(spacing: 0){
                        
                        ZStack {
                            Image("the-witcher").resizable().scaledToFill()
                            
                            Image(systemName: "play.circle.fill")
                                .resizable()
                                .foregroundColor(.white)
                                .frame(width: 42, height: 42)
                        }
                        
                        Text("The Wither 3: Wild Hunt").frame(minWidth: 0,  maxWidth: .infinity,  alignment: .leading)
                            .background(.gray)
                    }
                })
                
                
                
                
                
            }.frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
             .padding(.vertical)
            
            
            Text("Recommended categories").font(.title3).foregroundColor(.white).bold().frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
            
            ScrollView(.horizontal, showsIndicators: false){
                
                HStack{
                    
                    Button(action: {print("pulsando")}, label: {
                        
                        ZStack{
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color("magenta"))
                                .frame(width: 160, height: 90)
                            
                            Image("rpg-icon")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 42, height: 42)
                        }
                    })
                    
                    Button(action: {print("pulsando shooter")}, label: {
                        
                        ZStack{
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color("magenta"))
                                .frame(width: 160, height: 90)
                            
                            Image("shooter-icon")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 42, height: 42)
                        }
                    })
                    
                    Button(action: {print("pulsando openW")}, label: {
                        
                        ZStack{
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color("magenta"))
                                .frame(width: 160, height: 90)
                            
                            Image("open-world-icon")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 42, height: 42)
                        }
                    })
                }
            }.padding()
            
            Text("Recommended for you").font(.title3).foregroundColor(.white).bold().frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
            
            //Recommended for you
            ScrollView(.horizontal, showsIndicators: false){ //Recommended for you
                
                HStack {
                    Button(action: {
                        //url = urlVideos[1]
                        //print("juego \(url)")
                        //isPlayerActive = true
                        searchGame(name: "Cuphead")
                        
                    }, label: {
                        KFImage(URL(string: "https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_48477e4a865827aa0be6a44f00944d8d2a3e5eb9.600x338.jpg")!)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 240, height: 135)
                        
//                        Image("abzu")
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: 240, height: 135)
                })
                    
                    Button(action: {
                        searchGame(name: "Grand Theft Auto V")
                        isPlayerActive = true
                        
                    }, label: {
                        KFImage(URL(string: "https://cdn.cloudflare.steamstatic.com/steam/apps/271590/ss_bab596ea9a6924055cd8c097bba75f052c18025d.600x338.jpg")!)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 240, height: 135)
//                        Image("battlefield")
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: 240, height: 135)
                    })
                    
                    Button(action: {
                        searchGame(name: "Crash Bandicoot™ N. Sane Trilogy")
                        isPlayerActive = true
                        
                    }, label: {
                        KFImage(URL(string: "https://cdn.cloudflare.steamstatic.com/steam/apps/731490/ss_bf301672eede469605ef823057cba1eb3b845f12.600x338.jpg")!)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 240, height: 135)
//                        Image("spyderman")
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: 240, height: 135)
                    })
                    
                }
                
                
                
            }.padding()
            
        }
        
        NavigationLink(isActive: $isGameViewActive, destination: {
            //VideoPlayer(player: AVPlayer(url: URL(string: url)!))
            GameView(url: url, titulo: titulo, studio: studio, calificacion: calificacion, anoPublicacion: anoPublicacion, descripcion: descripcion, tags: tags, imgsUrl: imgsUrl)
        }, label: {
            EmptyView()
        })
    }
    
    func searchGame(name: String) {
        
        
        gameFound.search(serachGame: name)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
            print("E: \(gameFound.gameInfo.count)")
            //isGameViewActive = true
            
            if gameFound.gameInfo.count == 0 {
                isGameInfoEmpty = true
            }else{
                url = gameFound.gameInfo[0].videosUrls.mobile
                titulo = gameFound.gameInfo[0].title
                studio = gameFound.gameInfo[0].studio
                calificacion = gameFound.gameInfo[0].contentRaiting
                anoPublicacion = gameFound.gameInfo[0].publicationYear
                descripcion = gameFound.gameInfo[0].description
                tags = gameFound.gameInfo[0].tags
                imgsUrl = gameFound.gameInfo[0].galleryImages
                
                isGameViewActive = true
            }
        }
    }
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
