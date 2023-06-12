//
//  ImageUploader.swift
//  swiftUIInstagram
//
//  Created by Chima onyekwere on 6/2/23.
//

import UIKit
import Firebase
import FirebaseStorage


struct ImageUploader {
    static func uploadImage(image:UIImage,completion:@escaping(String) -> Void){
        guard let imageData = image.jpegData(compressionQuality: 0.5) else {return}
        // for avatar images you can compress images pretty low because they don't need to be expanded
        let filename = NSUUID().uuidString
        //NSUUID().uuidString unique id for image
        let ref = Storage.storage().reference(withPath: "/profile_images/\(filename)")
        // create path to storage
        ref.putData(imageData, metadata:nil) {_, error in
            if let error = error {
                print("DEBUG: Failed to upload image \(error.localizedDescription)")
                return
            }
            
            print("Successfully uploaded Image ")
            
            ref.downloadURL { url, _ in
                guard let imageUrl = url?.absoluteString else { return }
                completion(imageUrl)
            }
            // in  means rhis is based on a completion rate 
        }
    }
    
    
    
    
}
