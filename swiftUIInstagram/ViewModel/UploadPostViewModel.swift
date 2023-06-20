//
//  UploadPostViewModel.swift
//  swiftUIInstagram
//
//  Created by Chima onyekwere on 6/13/23.
//

import SwiftUI
import Firebase


class UploadPostViewModel: ObservableObject {
    @Published var users = [User]()
    
    
    func uploadPost(caption:String, image:UIImage, completion: FsCompletion) {
        guard let user = AuthViewModel.shared.currentUser else {return}
        ImageUploader.uploadImage(image: image, type: .post) { imageUrl in
            let data = ["caption": caption,
                        "timestamp":Timestamp(date:Date()),
                        "likes":0,
                        "imageUrl": imageUrl,
                        "ownerUid": user.id ?? "",
                        "ownerImageUrl": user.profileImageUrl,
                        "ownerUsername": user.username] as [String: Any]
            COLLECTION_POSTS.addDocument(data: data, completion: completion)
            print("DEBUG: Uploaded post")
            
        }
    }
    
}
