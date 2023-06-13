//
//  ProfileViewModel.swift
//  swiftUIInstagram
//
//  Created by Chima onyekwere on 6/12/23.
//

import SwiftUI

class ProfileViewModel: ObservableObject {

    let user: User
    
    init(user: User) {
        self.user = user
    }
    
    func follow(){
        guard let uid = user.id else {return}
        UserService.follow(uid: uid) { _ in
            print("DEBUG:Successfully folowed \(self.user.username) ..")
        }
    }
    
    func unfollow(){
        print("DEBUG:Unfollow user ..")
        
    }
    

    
    func checkIfUserIsFollowed() {
        
    }
}


