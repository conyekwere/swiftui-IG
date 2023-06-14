//
//  UserService.swift
//  swiftUIInstagram
//
//  Created by Chima onyekwere on 6/12/23.
//

import Firebase
typealias FsCompletion = ((Error?) -> Void)?
struct UserService {
    
    static func follow(uid: String, completion: ((Error?) -> Void)?) {
        guard let currentUid = AuthViewModel.shared.userSession?.uid else {return}
        
        COLLECTION_FOLLOWING.document(currentUid)
            .collection("user-following").document(uid).setData([:]){ _ in
            COLLECTION_FOLLOWERS.document(uid).collection("user-followers").document(currentUid).setData([:], completion: completion)
                
                /// .setData([:]) we are setign a blank docuent to teack a list of id
        }
    }
    static func unfollow(uid: String,completion: ((Error?) -> Void)?) {
        guard let currentUid = AuthViewModel.shared.userSession?.uid else {return}
        COLLECTION_FOLLOWING.document(currentUid).collection("user-following").document(uid).delete(){ _ in
            COLLECTION_FOLLOWERS.document(uid).collection("user-followers").document(currentUid).delete(completion: completion)
            
        }
    }
    
    static func checkIfUserIsFollowed(uid: String, completion: @escaping(Bool?) -> Void){
        guard let currentUid = AuthViewModel.shared.userSession?.uid else {return}
        COLLECTION_FOLLOWING.document(currentUid).collection("user-following").document(uid).getDocument{ snapshot,  _ in
            guard let isFollowed = snapshot?.exists else {return}
            completion(isFollowed)
            
        }
    }
}

