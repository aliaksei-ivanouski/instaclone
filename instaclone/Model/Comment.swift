//
//  Comment.swift
//  instaclone
//
//  Created by Aliaksei Ivanouski on 28/05/2022.
//

import FirebaseFirestoreSwift
import Firebase

struct Comment: Identifiable, Decodable {
    @DocumentID var id: String?
    let commentText: String
    let username: String
    let postOwnerUid: String
    let profileImageUrl: String
    let timestamp: Timestamp
    let uid: String
}
