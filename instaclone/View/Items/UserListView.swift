//
//  UserListView.swift
//  instaclone
//
//  Created by Aliaksei Ivanouski on 05/05/2022.
//

import SwiftUI

struct UserListView: View {
    @ObservedObject var viewModel: SearchViewModel
    @Binding var searchText: String
    
    var users: [User] {
        return searchText.isEmpty ? viewModel.users : viewModel.filteredUsers(searchText)
    }
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(users) { user in
                    NavigationLink(
                        destination: ProfileView(user: user),
                        label: {
                            UserCell(user: user)
                                .padding(.leading)
                    })
                }
            }
        }
    }
}
