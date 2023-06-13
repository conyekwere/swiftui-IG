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
    }
    
    func follow(){
        guard let uid = user.id else {return}
        UserService.follow(uid: uid) { _ in
            print("DEBUG:Successfully folowed \(self.user.username) ..")
            self.user.isFollowed = true
        }
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
            print("DEBUG:Successfully Unfollowed \(self.user.username) ..")
            self.user.isFollowed = isFollowed
        }
    }
        //checkIfUserIsFollowed this view is to validate the cleint with the back end with a snapshot
        //isFollowed:Bool is the completion block
        //  guard !user.isCurrentUser else {return} make sure you don't follow current user
}


