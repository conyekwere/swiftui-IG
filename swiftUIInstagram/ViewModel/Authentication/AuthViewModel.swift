//
//  AuthViewModel.swift
//  swiftUIInstagram
//
//  Created by Chima onyekwere on 5/29/23.
//

import SwiftUI
import Firebase


class AuthViewModel: ObservableObject{
    @Published var userSession: FirebaseAuth.User?
    
    
    
    static let  shared = AuthViewModel()
    
    
    init(){
        userSession = Auth.auth().currentUser
    }
    
    func login(){
        print("Login")
    }
    
    func register(withEmail email:String, password:String,
                  image: UIImage?, fullname: String,username: String){
        guard let image = image else {return}
        // use guard to remove an optional 
        ImageUploader.uploadImage(image: image) { imageUrl in
            
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if let errorState = error{
                    print(errorState.localizedDescription)
                    return
                }
                guard let user = result?.user else {return}
                self.userSession = user
                print("Successfully registered user")
               //result and error is a from a completion parameter
                
                let data = ["email": email,
                            "username":username,
                            "fullname": fullname,
                            "profileImageUrl": imageUrl,
                            "uid": user.uid]
                Firestore.firestore().collection("users").document(user.uid).setData(data){ _ in
                    print("Successfully uploaded user data...")
                    self.userSession = user
                }
            }
        
        }
    }
    
    func signout(){
        self.userSession = nil
        try? Auth.auth().signOut()
    }
    
    func resetPassword(){
        
    }
    
    func fetchUser(){
        
    }
    
}
