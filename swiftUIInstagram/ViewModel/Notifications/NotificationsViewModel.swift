//
//  NotificationsViewModel.swift
//  swiftUIInstagram
//
//  Created by Chima onyekwere on 6/19/23.
//

import SwiftUI
import Firebase

class NotificationsViewModel:ObservableObject {
    @Published var notifications = [Notification]()
    //@Published var post : Post

    init() {
        if  (AuthViewModel.shared.currentUser != nil) {
            fetchNotifications()
        }
    }
   // static meaning uploadNotification function is public and don't need to init viewmodel func
 static func uploadNotification(toUid uid: String, type: NotificationType, post:Post? = nil) {
        guard let user = AuthViewModel.shared.currentUser else {return}
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
            COLLECTION_NOTIFICATIONS.document(uid).collection("user-notifications").addDocument(data: data)
        }
    
    
    
    
    func fetchNotifications() {
        
        guard let uid = AuthViewModel.shared.userSession?.uid else {return}
        
        let query = COLLECTION_NOTIFICATIONS.document(uid).collection("user-notifications").order(by:"timestamp", descending: true)
                
        query.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.notifications = documents.compactMap({try? $0.data(as: Notification.self) })
            
            print(self.notifications)
        }
    }
}
