//
//  GameView.swift
//  GameStream
//
//  Created by Jose Daniel Corredor Zambrano on 8/08/22.
//

import SwiftUI
import AVKit
import Kingfisher

struct GameView: View {
    
     var url:String
     var titulo:String
     var studio:String
     var calificacion: String
     var anoPublicacion: String
     var descripcion:String
     var tags:[String]
     var imgsUrl: [String]
    
    var body: some View {
        ZStack {
            Color("background").ignoresSafeArea()
            
            
            VStack {
                
                video(url: url).frame(height: 300)
                
                ScrollView {
                    
                    videoInfo(titulo: titulo, studio: studio, calificacion: calificacion, anoPublicacion: anoPublicacion, descripcion: descripcion, tags: tags, imgsUrl: imgsUrl)
                        .padding(.bottom)
                    
                    Gallery(imgsUrl: imgsUrl)
                    
                }.frame(maxWidth: .infinity)
            }
        }
    }
}

struct Gallery: View {
    var imgsUrl: [String]
    let formaGrid = [
        GridItem(.flexible())
    ]
    var body: some View{
        
        
        VStack {
            
            Text("GALLERY")
                .foregroundColor(.white)
                .font(.title)
                .padding(.leading)
            
            ScrollView(.horizontal){
                
                LazyHGrid(rows: formaGrid, spacing: 8){
                    
                    ForEach(imgsUrl, id: \.self){
                        imgUrl in
                        
                        KFImage(URL(string: imgUrl))
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    }
                }
            }
            
            
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color("magenta"))
                    .frame(width: .infinity, height: 150)
                .padding(10)
                
                VStack(alignment: .leading){
                    
                    HStack{
//                        KFImage(URL(string: <#T##String#>))
                        Image("abzu")
                            .resizable()
                            .clipShape(Circle())
                            .frame(width: 30, height: 30)
                        
                        Text("Titulo")
                            .font(.subheadline)
                            .foregroundColor(.white)
                            
                    }
                    
                    Text("This is an awesome videos")
                        .foregroundColor(.white)
                        .padding(.leading, 0)
                }
            }
            
            
            //
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color("magenta"))
                    .frame(width: .infinity, height: 150)
                .padding(10)
                
                VStack(alignment: .leading){
                    
                    HStack{
//                        KFImage(URL(string: <#T##String#>))
                        Image("abzu")
                            .resizable()
                            .clipShape(Circle())
                            .frame(width: 30, height: 30)
                        
                        Text("Titulo")
                            .font(.subheadline)
                            .foregroundColor(.white)
                            
                    }
                    
                    Text("This is an awesome videos")
                        .foregroundColor(.white)
                        .padding(.leading, 0)
                }
            }
        }
    }
}

struct video: View {
    var url: String
    var body: some View {
        
        VideoPlayer(player: AVPlayer(url: URL(string: url)!))
            .ignoresSafeArea()
        
        
    }
}

struct videoInfo: View {
    var titulo: String
    var studio: String
    var calificacion: String
    var anoPublicacion: String
    var descripcion:String
    var tags:[String]
    var imgsUrl: [String]
    var body: some View{
        
        VStack(alignment: .leading){
            
            Text("\(titulo)")
                .foregroundColor(.white)
                .font(.largeTitle)
                .padding(.leading)
            
            HStack{
                
                Text("\(studio)")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding(.top, 5)
                    .padding(.leading)
                
                Text("\(calificacion)")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .padding(.top, 5)
                
                Text("\(anoPublicacion)")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .padding(.top, 5)
            }
            
            Text("\(descripcion)")
                .foregroundColor(.white)
                .font(.subheadline)
                .padding(.top, 5)
                .padding(.leading)
            
            HStack{
                
                ForEach(tags, id: \.self){
                    tag in
                    
                    Text("# \(tag)")
                        .foregroundColor(.white)
                        .font(.subheadline)
                        .padding(.top, 4)
                        .padding(.leading)
                }
            }
            
        }.frame( maxHeight: .infinity, alignment: .leading)
    }
    
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(url: "ejemplo",titulo:"Sonic The Hedgehog"
            ,studio:"Sega"
            ,calificacion:"E+"
            ,anoPublicacion:"1991"
            ,descripcion:"Juego de Sega Genesis publicado en 1991 con más de 40 millones de copias vendidas actualmente"
            ,tags:["plataformas","mascota"], imgsUrl: [ "https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg","https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg","https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg"])
    }
}
