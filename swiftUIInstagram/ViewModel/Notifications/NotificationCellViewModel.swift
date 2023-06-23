//
//  NotificationCellViewModel.swift
//  swiftUIInstagram
//
//  Created by Chima onyekwere on 6/21/23.
//

import SwiftUI


class NotificationCellViewModel:ObservableObject {
    @Published var notification: Notification

    init(notification: Notification) {
        self.notification = notification
        checkIfUserIsFollowed()
        fetchNotificationPost()
    }


    func follow(){
        UserService.follow(uid:  notification.uid) { _ in
             self.notification.isFollowed = true
        }
        NotificationsViewModel.uploadNotification(toUid: self.notification.uid, type:.follow)
    }
    
    func unfollow(){
        UserService.unfollow(uid:  notification.uid) { _ in
            self.notification.isFollowed = false
        }
    }
    

    
    func checkIfUserIsFollowed() {
        guard notification.type == .follow else {return}
        UserService.checkIfUserIsFollowed(uid: notification.uid) { isFollowed in
            self.notification.isFollowed = isFollowed
        }
    }
    
    
    
    func fetchNotificationPost() {
        guard let postId = notification.postId  else {return}
        
        COLLECTION_POSTS.document(postId).getDocument { snapshot, _ in
            self.notification.post = try? snapshot?.data(as: Post.self)
        }
        
        
    }
    
}

