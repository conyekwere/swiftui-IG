//
//  Constants.swift
//  swiftUIInstagram
//
//  Created by Chima onyekwere on 6/8/23.
//

import Firebase

let COLLECTION_USERS =  Firestore.firestore().collection("users")

let COLLECTION_FOLLOWERS =  Firestore.firestore().collection("followers")

let COLLECTION_FOLLOWING =  Firestore.firestore().collection("following")

let COLLECTION_POSTS =  Firestore.firestore().collection("posts")

let COLLECTION_COMMENTS =  Firestore.firestore().collection("comments")
