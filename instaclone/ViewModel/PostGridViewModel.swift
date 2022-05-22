//
//  PostGridViewModel.swift
//  instaclone
//
//  Created by Aliaksei Ivanouski on 22/05/2022.
//

import SwiftUI

enum PostGridConfiguration {
    case explore
    case profile(String)
}

class PostGridViewModel: ObservableObject {
    @Published var posts = [Post]()
    let config: PostGridConfiguration
    
    init(config: PostGridConfiguration) {
        self.config = config
        fetchPosts(forConfig: config)
    }
    
    func fetchPosts(forConfig config: PostGridConfiguration) {
        switch config {
        case .explore:
            fetchExplorePagePosts()
        case .profile(let uid):
            fetchUserPosts(forUid: uid)
        }
    }
    
    func fetchExplorePagePosts() {
        COLLECTION_POSTS
            .order(by: "timestamp", descending: true)
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                self.posts = documents.compactMap({ try? $0.data(as: Post.self) })
            }
    }
    
    func fetchUserPosts(forUid uid: String) {
        COLLECTION_POSTS
            .whereField("ownerUid", isEqualTo: uid)
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                self.posts = documents.compactMap({ try? $0.data(as: Post.self) })
            }
    }
}