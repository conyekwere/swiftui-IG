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


func timestampString(for comment: Comment) -> String {
    let formatter = DateComponentsFormatter()
    formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
    formatter.maximumUnitCount = 1
    formatter.unitsStyle = .abbreviated
    return formatter.string(from: comment.timestamp.dateValue(), to: Date()) ?? " "
}

