//
//  FeedCellViewModel.swift
//  swiftUIInstagram
//
//  Created by Chima onyekwere on 6/16/23.
//

import SwiftUI

class FeedCellViewModel:ObservableObject {
    @Published var post : Post
    //Cannot assign value of type "self.post = post" to type '[Post]' because when you are init a model as a arg you can only call an instance
    init(post:Post) {
        self.post = post
    }
    func like() {}
    func unlike() {}
    
    func checkIfUserLikedPost() {}
}
