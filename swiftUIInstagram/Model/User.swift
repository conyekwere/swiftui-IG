//
//  User.swift
//  swiftUIInstagram
//
//  Created by Chima onyekwere on 6/8/23.
//

import FirebaseFirestoreSwift

// Decodable makes object out items
 struct User: Decodable,Identifiable{
    let username: String
    let email: String
    let profileImageUrl: String
    let fullname: String
    @DocumentID var id: String?
     var bio: String?
     var isFollowed: Bool? = false
     //isFollowed for client side rendering.toggle that switches depending on the user 
     var isCurrentUser: Bool {return AuthViewModel.shared.userSession?.uid == id}
     
     //if user logged in id matches one of the user ids  make true
     
     var stats: UserStats?
     // make optional since it's wasn't part of the original dictionary
}

 // add decodable to  attach item to User struct
struct UserStats:Decodable {
    var following: Int
    var posts:Int
    var followers: Int
    
}


