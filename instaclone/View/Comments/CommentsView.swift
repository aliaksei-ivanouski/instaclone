//
//  CommentsView.swift
//  instaclone
//
//  Created by Aliaksei Ivanouski on 28/05/2022.
//

import SwiftUI

struct CommentsView: View {
    @State var inputText = ""
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 24) {
                    ForEach(0 ..< 10) { _ in
                        CommentsCell()
                            
                    }
                }
            }.padding(.top)
            
            CustomInputView(inputText: $inputText, action: uploadComment)
        }
    }
    
    func uploadComment() {
        
    }
}

struct CommentsView_Previews: PreviewProvider {
    static var previews: some View {
        CommentsView()
    }
}
