//
//  Post.swift
//  swiftUIInstagram
//
//  Created by Chima onyekwere on 6/15/23.
//

import FirebaseFirestoreSwift
import Firebase


struct Post: Decodable,Identifiable{
   @DocumentID var id: String?
    let ownerUid: String
    let ownerUsername: String
    let caption: String
    let likes: Int
    let imageUrl: String
    let timestamp: Timestamp
    let ownerImageUrl: String
    var didLike: Bool? = false
}


