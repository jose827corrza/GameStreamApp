//
//  ContentView.swift
//  GameStream
//
//  Created by Jose Daniel Corredor Zambrano on 22/07/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack{
    //            Color(red: 105/255, green: 118/255, blue: 166/255, opacity: 1.0)
    //                .ignoresSafeArea()
                Color("background").ignoresSafeArea()
                VStack{
                    Image("applogo").resizable().aspectRatio(contentMode: .fit)
                        .frame(width: 250)
                        .padding(.bottom, 60)
                    LoginAndSignUp()
                    
                }
            }.navigationBarHidden(true) // para que no nos empuje las vistas hacia abajo
        }
    }
}

struct LoginAndSignUp: View {
    @State var loginType: Bool = true //true login
    var body: some View{
        VStack {
            HStack{
                Spacer()
                Button("INICIA SESIÓN", action: {
                    loginType = true
                    print("login")
                }).foregroundColor(loginType ? Color("dark-cian") : .gray)
                Spacer()
                Button("REGISTRATE", action: {
                    loginType = false
                    print("signup")
                }).foregroundColor(loginType ? .gray : Color("dark-cian"))
                Spacer()
            }
            Spacer(minLength: 42)
            
            if loginType {
                LoginSessionView()
            } else {
                SignUpSessionView()
            }
            
            
        }
    }
}

struct LoginSessionView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isPsswdVisible: Bool = true
    @State private var isHomeScreenActive: Bool = false
    
    var body: some View{
        ScrollView {
            VStack(alignment: .leading) {
                Text("Email").foregroundColor(Color("dark-cian"))
            
                ZStack(alignment: .leading){
                    if email.isEmpty {
                        Text(verbatim: "mail@gmail.com")
                            .foregroundColor(.gray)
                    }
                    TextField("", text: $email)
                }
                
                Divider().frame(height: 2)
                    .background(Color("dark-cian"))
                    .padding(.bottom)
                
                Text("Password").foregroundColor(Color("dark-cian"))
                
                ZStack(alignment: .leading){
                    if password.isEmpty {
                        Text("Type your password")
                            .foregroundColor(.gray)
                    }
                    HStack{
                        
                        if !isPsswdVisible {
                            TextField("", text: $password)
                        } else {
                            SecureField("", text: $password)
                        }
                        Button(action: {isPsswdVisible.toggle()}, label: {
                            Image(systemName: !isPsswdVisible ? "eye" : "eye.slash").foregroundColor(Color("dark-cian"))
                        })
                    }
                    
                    
                    
                }
                
                Divider().frame(height: 2)
                    .background(Color("dark-cian"))
                    .padding(.bottom)
                
                
                Button(action: {print("forgot password")}, label: {
                    Text("Forgot your password?")
                        .font(.footnote)
                        .frame(width: 300, alignment: .trailing)
                        .foregroundColor(Color("dark-cian"))
                        .padding(.bottom)
                    
                })
                
                Button(action: login, label: {
                    Text("LOGIN !")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                        .overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("dark-cian"), lineWidth: 2.0).shadow(color: .white, radius: 6))
                }).padding(.bottom)
                
                Text("Sign in using your social networks").foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.top)
                
                
                
                HStack{
                    
                    Spacer()
                    
                    Button(action: {
                        print("facebook")
                    }, label: {
                        Text("Facebook")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.vertical, 3.0)
                            .frame(maxWidth: .infinity,maxHeight: 400, alignment: .center)
                            .background(.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 4.0))
                            
                    })
                    
                    Spacer()
                    
                    Button(action: {
                        print("facebook")
                    }, label: {
                        Text("Twitter").font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.vertical, 3.0)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .background(.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 4.0))
                    })
                    
                    Spacer()
                }
                
                }
            }.padding(.horizontal, 20)
        
        NavigationLink(isActive: $isHomeScreenActive, destination: {
            HomeView()
        }, label: {
            EmptyView()
        })
        
    }
    
    func login() {
        print("login")
        isHomeScreenActive = true
    }
}


struct SignUpSessionView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var verifyPassword: String = ""
    @State private var isPsswdVisible: Bool = false
    var body: some View{
        ScrollView {
            
            VStack(alignment: .center){
                Text("Choose your profile picture")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text("You can change it later")
                    .font(.footnote)
                    .fontWeight(.light)
                    .foregroundColor(.white)
                    .padding(.bottom)
                
                Button(action: {print("foto")}, label: {
                    ZStack {
                        Circle().frame(width: 100, height: 100)
                            .foregroundColor(.gray)
//                        Image(systemName: "person")
//                            .resizable()
//                            .frame(width: 100, height: 100)
                        Image(systemName: "camera")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.white)
                    }
                })
            }
            
            VStack(alignment: .leading) {
                Text("Email").foregroundColor(Color("dark-cian")).frame(width: 300, alignment: .leading)
            
                ZStack(alignment: .leading){
                    if email.isEmpty {
                        Text(verbatim: "mail@gmail.com")
                            .foregroundColor(.gray)
                    }
                    TextField("", text: $email)
                }
                
                Divider().frame(height: 2)
                    .background(Color("dark-cian"))
                    .padding(.bottom)
                
                VStack(alignment: .leading){ // Passwords
                    Text("Password").foregroundColor(Color("dark-cian"))
                    
                    
                    ZStack(alignment: .leading){
                        if password.isEmpty {
                            Text("Type your password")
                                .foregroundColor(.gray)
                        }
                        HStack{
                            
                            if !isPsswdVisible {
                                TextField("", text: $password)
                            } else {
                                SecureField("", text: $password)
                            }
                            Button(action: {isPsswdVisible.toggle()}, label: {
                                Image(systemName: !isPsswdVisible ? "eye" : "eye.slash").foregroundColor(Color("dark-cian"))
                            })
                        }
                        
                        
                        
                    }
                    
                    Divider().frame(height: 2)
                        .background(Color("dark-cian"))
                        .padding(.bottom)
                    
                    Text("Verify Password").foregroundColor(Color("dark-cian"))
                    
                    ZStack(alignment: .leading){
                        if password.isEmpty {
                            Text("Type your password again")
                                .foregroundColor(.gray)
                        }
                        HStack{
                            
                            if !isPsswdVisible {
                                TextField("", text: $verifyPassword)
                            } else {
                                SecureField("", text: $verifyPassword)
                            }
                            Button(action: {isPsswdVisible.toggle()}, label: {
                                Image(systemName: !isPsswdVisible ? "eye" : "eye.slash").foregroundColor(Color("dark-cian"))
                            })
                        }
                        
                        
                        
                    }
                }
                
                Divider().frame(height: 2)
                    .background(Color("dark-cian"))
                    .padding(.bottom)
                
                
                Button(action: {print("forgot password")}, label: {
                    Text("Forgot your password?")
                        .font(.footnote)
                        .frame(width: 300, alignment: .trailing)
                        .foregroundColor(Color("dark-cian"))
                        .padding(.bottom)
                    
                })
                
                Button(action: {print("registro")}, label: {
                    Text("SIGN UP !")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                        .overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("dark-cian"), lineWidth: 2.0).shadow(color: .white, radius: 6))
                }).padding(.bottom)
                
                Text("Sign up using your social networks").foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.top)
                
                
                
                HStack{
                    
                    Spacer()
                    
                    Button(action: {
                        print("facebook")
                    }, label: {
                        Text("Facebook")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.vertical, 3.0)
                            .frame(maxWidth: .infinity,maxHeight: 400, alignment: .center)
                            .background(.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 4.0))
                            
                    })
                    
                    Spacer()
                    
                    Button(action: {
                        print("facebook")
                    }, label: {
                        Text("Twitter").font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.vertical, 3.0)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .background(.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 4.0))
                    })
                    
                    Spacer()
                }
                
                }
            }.padding(.horizontal, 20)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Image("pantalla2")
        ContentView()
    }
}
