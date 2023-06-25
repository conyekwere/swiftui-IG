//
//  ProfileViewModel.swift
//  swiftUIInstagram
//
//  Created by Chima onyekwere on 6/12/23.
//

import SwiftUI

class ProfileViewModel: ObservableObject {
    
    @Published  var user: User
    
    init(user: User) {
        self.user = user
        checkIfUserIsFollowed()
        fetchUserStatus()
    }
    
    func follow(){
        guard let uid = user.id else {return}
        UserService.follow(uid: uid) { _ in
            //  print("DEBUG:Successfully folowed \(self.user.username) ..")
            self.user.isFollowed = true
        }
        NotificationsViewModel.uploadNotification(toUid: uid, type:.follow)
    }
    
    func unfollow(){
        guard let uid = user.id else {return}
        UserService.unfollow(uid: uid) { _ in
            print("DEBUG:Successfully Unfollowed \(self.user.username) ..")
            self.user.isFollowed = false
        }
    }
    
    
    
    func checkIfUserIsFollowed() {
        guard !user.isCurrentUser else {return}
        guard let uid = user.id else {return}
        UserService.checkIfUserIsFollowed(uid: uid) { isFollowed in
            self.user.isFollowed = isFollowed
        }
    }
    //checkIfUserIsFollowed this view is to validate the cleint with the back end with a snapshot
    //isFollowed:Bool is the completion block
    //  guard !user.isCurrentUser else {return} make sure you don't follow current user
    
    
    func fetchUserStatus(){
        guard let uid = user.id else {return}
        COLLECTION_FOLLOWING.document(uid).collection("user-following").getDocuments { snapshot,  _ in
            guard let following = snapshot?.documents.count else {return}
            //self.user.stat?.following = following
            
            COLLECTION_FOLLOWERS.document(uid).collection("user-followers").getDocuments { snapshot,  _ in
                guard let followers = snapshot?.documents.count else {return}
                
                COLLECTION_POSTS.whereField("ownerUid", isEqualTo: uid).getDocuments { snapshot,  _ in
                    guard let posts = snapshot?.documents.count else {return}
                    
                    self.user.stats = UserStats(following: following, posts: posts, followers: followers)
                    print("DEBUG:\(self.user.fullname) user status : \(self.user.stats) ..")
                    }
          
                }
        }
        
        
        

    }
 
}
