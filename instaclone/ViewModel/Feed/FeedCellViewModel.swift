//
//  FeedCellViewModel.swift
//  instaclone
//
//  Created by Aliaksei Ivanouski on 28/05/2022.
//

import SwiftUI

class FeedCellViewModel: ObservableObject {
    @Published var post: Post
    
    init(post: Post) {
        self.post = post
    }
    
    func like() {
        print("Liked")
    }
    
    func unlike() {
        print("Unliked")
    }
    
    func checkIfUserLikedPost() {
        
    }
}
