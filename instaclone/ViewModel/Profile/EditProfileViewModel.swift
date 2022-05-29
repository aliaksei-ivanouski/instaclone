//
//  EditProfileViewModel.swift
//  instaclone
//
//  Created by Aliaksei Ivanouski on 29/05/2022.
//

import SwiftUI

class EditProfileViewModel: ObservableObject {
    var user: User
    @Published var uploadCompleted = false
    
    init(user: User) {
        
        self.user = user
    }
    
    func saveUserBio(_ bio: String) {
        guard let uid = user.id else { return }
        COLLECTION_USERS.document(uid).updateData(["bio": bio]) { _ in
            self.user.bio = bio
            self.uploadCompleted = true
        }
    }
}
