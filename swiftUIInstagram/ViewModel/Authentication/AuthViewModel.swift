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
    
    @Published var currentUser: User?
    
    static let  shared = AuthViewModel()
    
    
    init(){
        userSession = Auth.auth().currentUser
        fetchUser()
    }
    
    func login(withEmail email:String, password:String){
        print("Login")
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let errorState = error{
                print("DEBUG: Login failed \(errorState.localizedDescription)")
                return
            }
            guard let user = result?.user else {return}
            self.userSession = user
            self.fetchUser()
        }
    }
    
    func register(withEmail email:String, password:String,
                  image: UIImage?, fullname: String,username: String){
        guard let image = image else {return}
        // use guard to remove an optional
        ImageUploader.uploadImage(image: image, type: .profile) { imageUrl in
            
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if let errorState = error{
                  //  print(errorState.localizedDescription)
                    return
                }
                guard let user = result?.user else {return}
                self.userSession = user
              
               //result and error is a from a completion parameter
                
                let data = ["email": email,
                            "username":username,
                            "fullname": fullname,
                            "profileImageUrl": imageUrl,
                            "uid": user.uid]
                COLLECTION_USERS.document(user.uid).setData(data){ _ in
                   
                    self.userSession = user
                    self.fetchUser()
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
        
        guard let uid = userSession?.uid else {return}
        COLLECTION_USERS.document(uid).getDocument { snapshot, _ in
            print(snapshot?.data())
            guard let user = try? snapshot?.data(as: User.self)  else {return}
            print("DEBUG: user is  \(user)")
            
            self.currentUser = user 
            
            //use decoable, DocumentID anf firestore swift to get rid of defining each value. This will automatically match to firebase
            
            
            ///removed  UID and replaced with   @DocumentID var id: String? in model
//            guard let dictionary = snapshot?.data() else {return} // this is an object
//            guard let username = dictionary["username"] as? String else {return}
//            guard let email = dictionary["email"] as? String else {return}
//            guard let profileImageUrl = dictionary["profileImageUrl"] as? String else {return}
//            guard let fullname = dictionary["fullname"] as? String else {return}
//            guard let uid = dictionary["uid"] as? String else {return}
//            let user = User(username: username, email: email, profileImageUrl: profileImageUrl, fullname: fullname, uid: uid)
//
//            print(user.username)
//            print(user.email)
            
            
            
            /// a snapshot is the data a user gets back
            /// Find username static typed
//            guard let dictionary = snapshot?.data() else {return}
//            guard let username = dictionary["username"] as? String else {return}
//            print("DEBUG: Username is  \(username)")
        }
    }
    
}
