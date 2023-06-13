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
        print("DEBUG:follow user ..")
    }
    
    func unfollow(){
        print("DEBUG:Unfollow user ..")
        
    }
    
    func checkIfUserIsFollowed() {
        
    }
}


