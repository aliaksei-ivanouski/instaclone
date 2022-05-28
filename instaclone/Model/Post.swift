//
//  Post.swift
//  instaclone
//
//  Created by Aliaksei Ivanouski on 22/05/2022.
//

import FirebaseFirestoreSwift
import Firebase

struct Post: Identifiable, Decodable {
    @DocumentID var id: String?
    let ownerUid: String
    let ownerUsername: String
    let ownerImageUrl: String
    let caption: String
    let likes: Int
    let imageUrl: String
    let timestamp: Timestamp
    
    var didLike: Bool? = false
}
