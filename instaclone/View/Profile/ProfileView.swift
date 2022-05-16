//
//  ProfileView.swift
//  instaclone
//
//  Created by Aliaksei Ivanouski on 05/05/2022.
//

import SwiftUI

struct ProfileView: View {
    let user: User
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                ProfileHeaderView(user: user)
                
                PostGridView()
            }
            .padding(.top)
        }
    }
}
