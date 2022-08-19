//
//  ProfileView.swift
//  GameStream
//
//  Created by Jose Daniel Corredor Zambrano on 16/08/22.
//

import SwiftUI

struct ProfileView: View {
    
    @State var username:String = "Lorem"
    @State var profileImage: UIImage = UIImage(named: "profileExample")!
    var body: some View {
        
        ZStack {
            Color("background")
                .ignoresSafeArea()
                .navigationBarBackButtonHidden(false)
                .navigationBarHidden(false)
            
            VStack {
                
                Text("Profile")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity,  alignment: .center)
                    .padding()
                
                VStack{
                    Image(uiImage: profileImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 118.0, height: 118.0)
                        .clipShape(Circle())
                    Text(username)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                    
                }.padding(EdgeInsets(top: 16, leading: 0, bottom: 32, trailing: 0))
                
                Text("Settings")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity,  alignment: .leading)
                    .padding(.leading, 18)
                
                SettingsModule()
            }
            
        }.onAppear(perform: {
            //Recuperar imagen
            if returnUiImage(named: "profileExample") != nil {
                profileImage = returnUiImage(named: "profileExample")!
            }else{
                print("Couldn'f find image, does not exist")
            }
            
            
            print("profileview")
            
            //Recuperar datos usuario
            if UserDefaults.standard.object(forKey: "datosUsuario") != nil {
                username = UserDefaults.standard.stringArray(forKey: "datosUsuario")![2]
            }
        })
    }
    
    func returnUiImage(named: String) -> UIImage? {
        
        if let dir = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false){
            
            return UIImage(contentsOfFile: URL(fileURLWithPath: dir.absoluteString).appendingPathComponent(named).path)
        }
        return nil
    }
}


struct SettingsModule: View {
    
    @State private var isToggleOn = true
    @State var isEditProfileViewActive = false
    var body: some View{
        VStack(spacing: 3) {
            
            Button(action: {print("account")}, label: {
                HStack{
                    Text("Account")
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .foregroundColor(.white)
                }.padding()
                
            }).background(Color("dark-cian"))
                .clipShape(RoundedRectangle(cornerRadius: 2.0))
            
            Button(action: {print("notifications")}, label: {
                HStack{
                    Text("Notifications")
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Toggle(isOn: $isToggleOn, label: {Text("")})
                }.padding()
                
            }).background(Color("dark-cian"))
                .clipShape(RoundedRectangle(cornerRadius: 2.0))
            
            Button(action: {
                print("Edit profile")
                isEditProfileViewActive = true
            }, label: {
                HStack{
                    Text("Edit profile")
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .foregroundColor(.white)
                }.padding()
                
            }).background(Color("dark-cian"))
                .clipShape(RoundedRectangle(cornerRadius: 2.0))
            
            Button(action: {
                print("rating")
                isEditProfileViewActive = true
            }, label: {
                HStack{
                    Text("Rate this app")
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .foregroundColor(.white)
                }.padding()
                
            }).background(Color("dark-cian"))
                .clipShape(RoundedRectangle(cornerRadius: 2.0))
            
            NavigationLink(destination: EditProfileView(), isActive: $isEditProfileViewActive, label: {
                EmptyView()
            })
            
            Spacer()
        }
    }
}
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
