//
//  RegistrationView.swift
//  swiftUIInstagram
//
//  Created by Chima onyekwere on 5/14/23.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var username = ""
    @State private var fullname = ""
    @Environment(\.presentationMode) var mode
    var signUpColor = #colorLiteral(red: 0.3490230441, green: 0.1391848922, blue: 0.9731792808, alpha: 1)
    
    
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var selectedImage:UIImage?
    @State var profileImage: Image?
    
    @State var imagePickerPresented = false
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.pink,Color.purple,Color.blue,]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
                VStack{
                    
                    if let profileImage = profileImage {
                        Button(action:{imagePickerPresented.toggle()}, label: {
                            VStack(spacing: -2) {
                                profileImage
                                    .resizable()
                                    .scaledToFill()
                                    .clipShape(Circle())
                                    .frame(width: 80,height: 80)
                                    .foregroundColor(Color(.init(white: 1, alpha: 0.50)))
                                Text(" Change Profile Photo ")
                                    .frame( width: 180 , height: 30)
                                    .font(.system(size: 14, weight: .semibold))
                                    .foregroundColor(.white)
                                    .background(Color(.init(white: 1, alpha: 0.15)))
                                    .cornerRadius(8)
                                    .clipShape(Capsule())
                                    .padding()
                                
                            }
                        }).sheet(isPresented: $imagePickerPresented, onDismiss: {
                            loadImage()
                        },  content: {ImagePicker(image:$selectedImage)})
                        
                        
                    }
                else{
                    Button(action:{imagePickerPresented.toggle()}, label: {
                        VStack(spacing: -2) {
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                                .renderingMode(.template)
                                .scaledToFill()
                                .frame(width: 80,height: 80)
                                .foregroundColor(Color(.init(white: 1, alpha: 0.50)))
                            Text(" Add Profile Photo ")
                                .frame( width: 150 , height: 30)
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(.white)
                                .background(Color(.init(white: 1, alpha: 0.15)))
                                .cornerRadius(8)
                                .clipShape(Capsule())
                                .padding()
                            
                        }
                    }).sheet(isPresented: $imagePickerPresented, onDismiss: {
                        loadImage()
                    },  content: {ImagePicker(image:$selectedImage)})
                    
                    
                }
                
                VStack(spacing:20){
                    // email field
                    CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal, 40)
                    //Username
                    CustomTextField(text: $username, placeholder: Text("Username"), imageName: "person")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal, 40)
                    //Full Name
                    CustomTextField(text: $fullname, placeholder: Text("Full Name"), imageName: "person")
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
                    
                    
                }
                Button(
                    action:{
                        viewModel.register(withEmail: email, password: password)
                }, label: {
                    Text("Sign Up")
                        .frame( width: 360 , height: 50)
                        .font(.headline)
                        .foregroundColor(.white)
                        .background(Color(signUpColor))
                        .cornerRadius(8)
                        .clipShape(Capsule())
                        .padding()
                })
                Spacer()
                
                Button(
                    action:{ mode.wrappedValue.dismiss() }, label: {
                        
                        HStack(spacing:4){
                            Text("Already have an account?")
                                .font(.system(size: 14, weight: .regular))
                            
                            Text("Sign In")
                                .font(.system(size: 14, weight: .semibold))
                            
                        }.foregroundColor(.white)
                        
                        
                        
                    }).padding(.bottom,16)
                
            }.padding(.top,56)
        }
    }
}
}


extension RegistrationView{
    func loadImage(){
        /// when closing picker  grab selectedImage image from imageicker and place as post image
        guard let selectedImage = selectedImage else{ return }
        profileImage = Image(uiImage: selectedImage)
    }
}


struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
