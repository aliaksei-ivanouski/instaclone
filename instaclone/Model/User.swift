//
//  User.swift
//  instaclone
//
//  Created by Aliaksei Ivanouski on 16/05/2022.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let username: String
    let fullName: String
    let profileImageUrl: String
    let email: String
    var isFollowed: Bool? = false
    var stats: UserStats?
    var bio: String?
    
    var isCurrentUser: Bool {
        return AuthViewModel.shared.userSession?.uid == id
    }
}

struct UserStats: Decodable {
    let following: Int
    let posts: Int
    let followers: Int
}
