//
//  FavoriteView.swift
//  GameStream
//
//  Created by Jose Daniel Corredor Zambrano on 15/08/22.
//

import SwiftUI
import AVKit

struct FavoriteView: View {
    
    @ObservedObject var allThegames = ViewModel()
    
    var body: some View {
        ZStack {
            Color("background").ignoresSafeArea()
            
            VStack {
                Text("FAVORITES")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.bottom, 9)
                
                ScrollView{
                    
                    ForEach(allThegames.gamesInfo, id: \.self){
                        game in
                        
                        VStack(spacing: 0) {
                            VideoPlayer(player: AVPlayer(url: URL(string: game.videosUrls.mobile)!))
                                .frame(height: 300)
                            Text("\(game.title)")
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(Color("dark-cian"))
                                .clipShape(RoundedRectangle(cornerRadius: 3.0))
                        }
                    }
                }.padding(.bottom, 8)
            }
            
            
            
            
            
        }.navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
