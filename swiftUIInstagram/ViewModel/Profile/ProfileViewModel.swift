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
        
    }
}


