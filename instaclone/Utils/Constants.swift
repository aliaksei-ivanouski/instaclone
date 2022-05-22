//
//  Constants.swift
//  instaclone
//
//  Created by Aliaksei Ivanouski on 16/05/2022.
//

import Firebase

let COLLECTION_USER = Firestore.firestore().collection("users")
let COLLECTION_FOLLOWERS = Firestore.firestore().collection("followers")
let COLLECTION_FOLLOWING = Firestore.firestore().collection("following")
let COLLECTION_POSTS = Firestore.firestore().collection("posts")
