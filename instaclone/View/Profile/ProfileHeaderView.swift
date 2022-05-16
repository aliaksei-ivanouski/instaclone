//
//  ProfileHeaderView.swift
//  instaclone
//
//  Created by Aliaksei Ivanouski on 05/05/2022.
//

import SwiftUI
import Kingfisher

struct ProfileHeaderView: View {
    let user: User
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                KFImage(URL(string: user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                    .padding(.leading)
                
                Spacer()
                
                HStack(spacing: 16) {
                    UserStatView(value: 1, title: "Posts")
                    UserStatView(value: 2, title: "Followers")
                    UserStatView(value: 1, title: "Following")
                }
                .padding(.trailing, 32)
            }
            
            Text(user.fullName)
                .font(.system(size: 15, weight: .semibold))
                .padding([.leading, .top])
            
            Text("Gotham's Dark Knight || Billionare")
                .font(.system(size: 15))
                .padding(.leading)
                .padding(.top, 1)
            
            HStack {
                Spacer()
                
                ProfileActionButton(isCurrentUser: user.isCurrentUser)
                
                Spacer()
            }
            .padding(.top)
        }
    }
}
