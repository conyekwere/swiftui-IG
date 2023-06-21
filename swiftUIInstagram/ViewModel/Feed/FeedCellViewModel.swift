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
    
    
    
    var likeString: String {
        let label =  post.likes == 1 ? "like" : "likes"
        return "\(post.likes) \(label)"
    }
    
    init(post:Post) {
        self.post = post
        checkIfUserLikedPost()
    }
    func like() {
        guard let uid = AuthViewModel.shared.userSession?.uid else {return}
        guard let postId = self.post.id else {return}
        COLLECTION_POSTS.document(postId).collection("post-likes").document(uid).setData([:]){ _ in
            COLLECTION_USERS.document(uid).collection("user-likes")
                .document(postId).setData([:]){ _ in
                    COLLECTION_POSTS.document(postId).updateData(["likes" : self.post.likes + 1])
                    
                    NotificationsViewModel.uploadNotification(toUid:self.post.ownerUid, type: .like,post: self.post)
                    
                    self.post.didLike = true
                    self.post.likes += 1
                }
        }
        print("Liked Post")
        
    }
    
    func unlike() {
        guard post.likes > 0 else { return }
        guard let uid = AuthViewModel.shared.userSession?.uid else {return}
        guard let postId = self.post.id else {return}
        
        
        COLLECTION_POSTS.document(postId).collection("post-likes").document(uid).delete { _ in
            COLLECTION_USERS.document(uid).collection("user-likes")
                .document(postId).delete{ _ in
                    COLLECTION_POSTS.document(postId).updateData(["likes" : self.post.likes - 1])
                    
                    self.post.didLike = false
                    self.post.likes -= 1
                }
        }
        
        print("Unliked Post")
        
        
    }
    
    func checkIfUserLikedPost() {
        guard let uid = AuthViewModel.shared.userSession?.uid else {return}
        guard let postId = self.post.id else { return }
        COLLECTION_USERS.document(uid).collection("user-likes").document(postId)
            .getDocument{ snapshot,  _ in
                guard let didLike = snapshot?.exists else { return }
                self.post.didLike = didLike
            }
    }
}
