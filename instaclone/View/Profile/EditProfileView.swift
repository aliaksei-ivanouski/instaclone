//
//  EditProfileView.swift
//  instaclone
//
//  Created by Aliaksei Ivanouski on 29/05/2022.
//

import SwiftUI

struct EditProfileView: View {
    @State private var bioText: String
    @Binding var user: User
    @ObservedObject private var viewModel: EditProfileViewModel
    @Environment(\.presentationMode) var mode
    
    init(user: Binding<User>) {
        self._user = user
        self.viewModel = EditProfileViewModel(user: self._user.wrappedValue)
        self._bioText = State(initialValue: _user.wrappedValue.bio ?? "")
    }
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    mode.wrappedValue.dismiss()
                }) {
                    Text("Cancel").bold()
                }
                
                Spacer()
                
                Button(action: {
                    viewModel.saveUserBio(bioText)
                }) {
                    Text("Done").bold()
                }
            }
            .padding()
            
            TextArea(text: $bioText, placeholder: "Add your bio..")
                .frame(width: 370, height: 200)
                .padding()
            
            Spacer()
        }
        .onReceive(viewModel.$uploadCompleted, perform: { completed in
            if completed {
                self.mode.wrappedValue.dismiss()
                self.user.bio = viewModel.user.bio
            }
        })
    }
}
