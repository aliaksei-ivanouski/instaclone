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
    
    var isCurrentUser: Bool {
        return AuthViewModel.shared.userSession?.uid == id
    }
}
