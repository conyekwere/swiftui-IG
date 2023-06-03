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
    
    func register(withEmail email:String, password:String){
//        print("Register")
//        print(email)
//        print(password)
//
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let errorState = error{
                print(errorState.localizedDescription)
                return
            }
            guard let user = result?.user else {return}
            self.userSession = user
            print("Successfully registered user")
            
           //result and error is a from a completion parameter sts
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
