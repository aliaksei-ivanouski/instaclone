//
//  CommentsCell.swift
//  instaclone
//
//  Created by Aliaksei Ivanouski on 28/05/2022.
//

import SwiftUI

struct CommentsCell: View {
    var body: some View {
        HStack {
            Image("sea_feed")
                .resizable()
                .scaledToFill()
                .frame(width: 36, height: 36)
                .clipShape(Circle())
            
            Text("batman").font(.system(size: 14, weight: .semibold)) + Text(" some text comment for now").font(.system(size: 14))
            
            Spacer()
            
            Text("2m")
                .foregroundColor(.gray)
                .font(.system(size: 12))
                .padding(.trailing)
        }
        .padding(.horizontal)
    }
}

struct CommentsCell_Previews: PreviewProvider {
    static var previews: some View {
        CommentsCell()
    }
}
