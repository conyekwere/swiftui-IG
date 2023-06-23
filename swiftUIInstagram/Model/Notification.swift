//
//  Notification.swift
//  swiftUIInstagram
//
//  Created by Chima onyekwere on 6/19/23.
//


import FirebaseFirestoreSwift
import Firebase


struct Notification: Decodable,Identifiable{
    @DocumentID var id: String?
    var postId: String?
    let username: String
    let profileImageUrl: String
    let timestamp: Timestamp
    let type: NotificationType
    let uid: String
    
    var isFollowed: Bool? = false
    var post:Post?
    //Bool must be optional because in the decodable is looking for a certian structure that has been already placed in the back end 
}


enum NotificationType: Int,Decodable {
    case like
    case comment
    case follow
    var notificationMessage: String {
        switch self  {
        case .like:
            return "liked one of your posts."
        case .comment:
            return "commented on one of your posts."
        case .follow:
            return "started following you."
        }
        
    }
    
}
