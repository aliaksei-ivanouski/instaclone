//
//  instacloneApp.swift
//  instaclone
//
//  Created by Aliaksei Ivanouski on 05/05/2022.
//

import SwiftUI
import Firebase

@main
struct instacloneApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(AuthViewModel.shared)
        }
    }
}
