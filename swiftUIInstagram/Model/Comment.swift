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
    let ownerUid: String
    let ownerUsername: String
    let caption: String
    var likes: Int
    let imageUrl: String
    let timestamp: Timestamp
    let ownerImageUrl: String
    var didLike: Bool? = false
}
