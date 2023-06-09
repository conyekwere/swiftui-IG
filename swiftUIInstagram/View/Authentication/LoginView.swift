//
//  LoginView.swift
//  swiftUIInstagram
//
//  Created by Chima onyekwere on 5/14/23.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    var buttonColor = #colorLiteral(red: 0.3490230441, green: 0.1391848922, blue: 0.9731792808, alpha: 1)
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.pink,Color.purple,Color.blue,]),
                               startPoint: .top, endPoint: .bottom)
                                .ignoresSafeArea()
                VStack{
                    Image("text-logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 220,height: 100)
                        .foregroundColor(.white)
                    
                    VStack(spacing:20){
                        // email field
                        CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                            .padding()
                            .background(Color(.init(white: 1, alpha: 0.15)))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .padding(.horizontal, 40)
                        // password field
                        CustomSecureField(text: $password, placeholder: Text("Password"))
                            .padding()
                            .background(Color(.init(white: 1, alpha: 0.15)))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .padding(.horizontal, 40)
                        
                        HStack{
                            Spacer()
   
                            NavigationLink(
                                destination: ResetPasswordView(email:$email), label: {
                                    Text("Forgot Password?")
                                        .font(.system(size: 14, weight: .semibold))
                                        .foregroundColor(.white)
                                        .padding(.top)
                                        .padding(.trailing,40)
                                })
                        }
                        
                        
                    }
                    
                    Button(action:{
                        viewModel.login(withEmail: email, password: password)
                        
                    }, label: {
                        Text("Sign In")
                            .frame( width: 360 , height: 50)
                            .font(.headline)
                            .foregroundColor(.white)
                            .background(Color(buttonColor))
                            .cornerRadius(8)
                            .clipShape(Capsule())
                            .padding()
                    })
                    Spacer(minLength: 50)
                    NavigationLink(
                        destination: RegistrationView().navigationBarHidden(true), label: {
                            
                            HStack(spacing:4){
                                Text("Don't have an account?")
                                    .font(.system(size: 14, weight: .regular))
                                
                                Text("Sign up")
                                    .font(.system(size: 14, weight: .semibold))
                                
                            }.foregroundColor(.white)
                            
                            
                            
                        }).padding(.bottom,16)
                    
                }.padding(.top,56)
            }
        }.accentColor(.white)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
