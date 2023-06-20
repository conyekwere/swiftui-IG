//
//  NotificationsViewModel.swift
//  swiftUIInstagram
//
//  Created by Chima onyekwere on 6/19/23.
//

import SwiftUI
import Firebase

class NotificationsViewModel:ObservableObject {
    @Published var commets = [Notification]()
    //@Published var post : Post

    init() {
        fetchNotifications()
    }
   // static meaning uploadNotification function is public and don't need to init viewmodel func
 static func uploadNotification(toUid uid: String, type: NotificationType, post:Post? = nil,completion: FsCompletion) {
        guard let user = AuthViewModel.shared.currentUser else {return}
        guard let uid = user.id else {return}
        //guard let postId = post.id else {return}
        var data: [String: Any] = [
                    "username":user.username,
                    "profileImageUrl": user.profileImageUrl,
                    "timestamp":Timestamp(date:Date()),
                    "type":type.rawValue,
                    "uid":user.id ?? "" ]
        //type.rawValue maps case to Int value
        if let post = post, let id = post.id {
          //  if post has value insert post id inside of notification object
            data["postId"] = id
                
        }
            COLLECTION_NOTIFICATIONS.document(uid).collection("user-notifications").addDocument(data: data) { error in if let error = error {
                print("DEBUG: Uploaded \(type.notificationMessage)")
                return
                }
            }

        }
    
    
    
    
    func fetchNotifications() {
        
//        guard let postId = post.id else {return}
//        let query = COLLECTION_POSTS.document(postId).collection("post-comments").order(by:"timestamp", descending: true)
//        query.addSnapshotListener { snapshot, _ in
//            guard let addedDocs = snapshot?.documentChanges.filter({$0.type == .added}) else
//            { return }
//
//            self.commets.append(contentsOf:addedDocs.compactMap({ try? $0.document.data(as: Comment.self)
//
//            }))
            
//            snapshot?.documentChanges.forEach({ change in
//                if change.type == .added{
//                    guard let comment = try? change.document.data(as: Comment.self) else {return}
//                    self.commets.append(comment)
//                }
//            })
            
            
 //       }
        
    }
    
    
}
