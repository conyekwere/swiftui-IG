//
//  PostGridViewModel.swift
//  swiftUIInstagram
//
//  Created by Chima onyekwere on 6/15/23.
//

import SwiftUI

enum PostGridConfig {
    case explore
    case profile(String)
}


class PostGridViewModel: ObservableObject {
    @Published var posts = [Post]()
    let config : PostGridConfig
    
    init(config:PostGridConfig) {
        self.config =  config
        fetchPost(forConfig: config)
    }

    func fetchPost(forConfig config: PostGridConfig) {
        switch config  {
        case .explore:
            fetchExplorePost()
        case .profile(let uid):
            fetchUserPost(forUid: uid)
            
        }
    }
    
    func fetchExplorePost() {
        COLLECTION_POSTS.getDocuments { snapshot, _ in
            guard let documents  = snapshot?.documents  else {return}
            self.posts = documents.compactMap({ try? $0.data(as: Post.self)})
            
        }
    }
    
    func fetchUserPost(forUid uid:String) {
        COLLECTION_POSTS.whereField("ownerUid", isEqualTo: uid).getDocuments { snapshot, _ in
            guard let documents  = snapshot?.documents  else {return}
            self.posts = documents.compactMap({ try? $0.data(as: Post.self)})
        }
    }
    
}
