//
//  CommentViewModel.swift
//  swiftUIInstagram
//
//  Created by Chima onyekwere on 6/17/23.
//

import SwiftUI
import Firebase

class CommentViewModel:ObservableObject {
    @Published var post : Post
    @Published var commets = [Comment]()


    
    init(post: Post) {
        self.post = post
        fetchComments()
    }
    
    
    func uploadComment(commentText: String) {
        guard let user = AuthViewModel.shared.currentUser else {return}
        guard let postId = post.id else {return}
        let data: [String: Any] = ["username":user.username,
                    "profileImageUrl": user.profileImageUrl,
                    "uid": user.id ?? "",
                    "timestamp":Timestamp(date:Date()),
                    "postOwnerUid": post.ownerUid,
                    "commentText":commentText
        ]
        COLLECTION_POSTS.document(postId).collection("post-comments").addDocument(data: data) { error in  if let error = error {
            print("Debug: Error upoloading comment:  \(error.localizedDescription)")
            return
            }
            NotificationsViewModel.uploadNotification(toUid: self.post.ownerUid, type: .comment,post: self.post)
        }
    }
    
    
    func fetchComments() {
        guard let postId = post.id else {return}
        let query = COLLECTION_POSTS.document(postId).collection("post-comments").order(by:"timestamp", descending: true)
        query.addSnapshotListener { snapshot, _ in
            guard let addedDocs = snapshot?.documentChanges.filter({$0.type == .added}) else
            { return }
            
            self.commets.append(contentsOf:addedDocs.compactMap({ try? $0.document.data(as: Comment.self)
                
            }))
            
//            snapshot?.documentChanges.forEach({ change in
//                if change.type == .added{
//                    guard let comment = try? change.document.data(as: Comment.self) else {return}
//                    self.commets.append(comment)
//                }
//            })
        }
        
    }
    
}
