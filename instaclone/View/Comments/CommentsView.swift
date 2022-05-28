//
//  CommentsView.swift
//  instaclone
//
//  Created by Aliaksei Ivanouski on 28/05/2022.
//

import SwiftUI

struct CommentsView: View {
    @State var commentText = ""
    @ObservedObject var viewModel: CommentsViewModel
    
    init(post: Post) {
        self.viewModel = CommentsViewModel(post: post)
    }
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 24) {
                    ForEach(viewModel.comments) { comment in
                        CommentsCell(comment: comment)
                    }
                }
            }.padding(.top)
            
            CustomInputView(inputText: $commentText, action: uploadComment)
        }
    }
    
    func uploadComment() {
        viewModel.uploadComment(commentText: commentText)
        commentText = ""
    }
}
