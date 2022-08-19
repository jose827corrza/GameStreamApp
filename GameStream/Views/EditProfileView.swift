//
//  EditProfileView.swift
//  GameStream
//
//  Created by Jose Daniel Corredor Zambrano on 16/08/22.
//

import SwiftUI

struct EditProfileView: View {
    
    @State var profileImage: Image? = Image("profileExample")
    @State private var isCameraActive: Bool = false
    @State private var isAPictureTaken = false
    var body: some View {
        ZStack {
            
            Color("background").ignoresSafeArea()
            
            ScrollView {
                VStack {
                    
                    Text("EDIT PROFILE")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    
                    Button(action: {
                        isCameraActive = true
                        print("editar foto")
                        
                    }, label: {
                        ZStack{
                            if !isAPictureTaken{
//                                Circle()
                                profileImage!
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 118.0, height: 118.0)
                                    .clipShape(Circle())
                                    .sheet(isPresented: $isCameraActive, content: {
                                        SUImagePickerView(sourceType: .photoLibrary, image: self.$profileImage, isPresented: $isCameraActive)
                                    })
                                Image(systemName: "camera")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(.white)
                            } else {
                                Image(systemName: "person")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 100, height: 100)
                                    .clipShape(Circle())
//                                    .sheet(isPresented: $isCameraActive, content: {
//                                        SUImagePickerView(sourceType: .photoLibrary, image: $profileImage, isPresented: $isCameraActive)
//                                    })
                                Image(systemName: "camera")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(.red)
                                
                            }
                        }
                    })
                }.padding(.bottom, 18.0)
                
                //Module
                EditModule()
            }
        }
    }
}


struct EditModule: View {
    
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    var body: some View{
        VStack(alignment: .leading) {
            
            Text("Email")
                .foregroundColor(Color("dark-cian"))
            .fontWeight(.bold)
            
            ZStack(alignment: .leading){
                
                if email.isEmpty {
                    Text(verbatim: "example@mail.com")
                        .font(.caption)
                        .foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0))
                }
                
                TextField("", text: $email)
            }
            
            Divider().frame(height: 1)
                .background(Color("dark-cian"))
            
            Text("Password")
                .foregroundColor(Color("dark-cian"))
            .fontWeight(.bold)
            
            ZStack(alignment: .leading){
                
                if password.isEmpty {
                    Text(verbatim: "Type your password")
                        .font(.caption)
                        .foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0))
                }
                
                SecureField("", text: $password)
            }
            
            Divider().frame(height: 1)
                .background(Color("dark-cian"))
            
            Text("Name")
                .foregroundColor(Color("dark-cian"))
            .fontWeight(.bold)
            
            ZStack(alignment: .leading){
                
                if name.isEmpty {
                    Text(verbatim: "Type your name")
                        .font(.caption)
                        .foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0))
                }
                
                TextField("", text: $name)
            }
            
            Divider().frame(height: 1)
                .background(Color("dark-cian"))
            
            
            Button(action: {
                updateDate()
            }, label: {
                Text("UPDATE DATA")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                    .overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("dark-cian"), lineWidth: 2.0).shadow(color: .white, radius: 6))
            }).padding(.top, 20)
            
        }.padding(.horizontal, 42.0)
    }
    
    func updateDate() {
        let updaterDataObject = SaveData()
        
        let resultado = updaterDataObject.guardarDatos(correo: email, contrasena: password, nombre: name)
                
        print("Se guardaron los datos con exito?: \(resultado)")
    }
}


struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
