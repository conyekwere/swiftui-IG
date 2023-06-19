//
//  Comment.swift
//  swiftUIInstagram
//
//  Created by Chima onyekwere on 6/17/23.
//


import FirebaseFirestoreSwift
import Firebase


struct Comment: Decodable,Identifiable{
    @DocumentID var id: String?
    let username: String
    let profileImageUrl: String
    let timestamp: Timestamp
    let postOwnerUid: String
    let commentText: String
    let uid: String


}
