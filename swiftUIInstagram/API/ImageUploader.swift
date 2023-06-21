//
//  ImageUploader.swift
//  swiftUIInstagram
//
//  Created by Chima onyekwere on 6/2/23.
//

import UIKit
import Firebase
import FirebaseStorage

enum UploadType {
    case profile
    case post
    var filePath: StorageReference {
        let filename = NSUUID().uuidString
        //NSUUID().uuidString unique id for image
        switch self  {
        case .profile:
            return Storage.storage().reference(withPath: "/profile_images/\(filename)")
        case .post:
            return Storage.storage().reference(withPath: "/post_images/\(filename)")
        }
        
    }
    
}

struct ImageUploader {
    static func uploadImage(image:UIImage,type: UploadType, completion:@escaping(String) -> Void){
        guard let imageData = image.jpegData(compressionQuality: 0.5) else {return}
        // for avatar images you can compress images pretty low because they don't need to be expanded
      
        let ref = type.filePath
        // create path to storage
        ref.putData(imageData, metadata:nil) {_, error in
            if let error = error {
                print("DEBUG: Failed to upload image \(error.localizedDescription)")
                return
            }
            
            //print("Successfully uploaded Image ")
            
            ref.downloadURL { url, _ in
                guard let imageUrl = url?.absoluteString else { return }
                completion(imageUrl)
            }
            // in  means rhis is based on a completion rate 
        }
    }
    
    
    
    
}
