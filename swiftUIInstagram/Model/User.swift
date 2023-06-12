//
//  User.swift
//  swiftUIInstagram
//
//  Created by Chima onyekwere on 6/8/23.
//

import FirebaseFirestoreSwift


 struct User: Decodable,Identifiable{
    let username: String
    let email: String
    let profileImageUrl: String
    let fullname: String
    @DocumentID var id: String?
    //let uid: String
}
