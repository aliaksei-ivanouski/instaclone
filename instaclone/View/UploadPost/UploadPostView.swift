//
//  UploadPostView.swift
//  instaclone
//
//  Created by Aliaksei Ivanouski on 05/05/2022.
//

import SwiftUI

struct UploadPostView: View {
    @State private var selectedImage: UIImage?
    @State var postImage: Image?
    @State var captionText = ""
    @State var imagePickerPresented = false
    @ObservedObject var viewModel = UploadPostViewModel()
    
    var body: some View {
        VStack {
            if postImage == nil {
                Button(action: {
                    imagePickerPresented.toggle()
                }, label: {
                    Image("plus_circle")
                        .resizable()
                        .renderingMode(.template)
                        .scaledToFill()
                        .frame(width: 180, height: 180)
                        .clipped()
                        .padding(.top, 56)
                        .foregroundColor(.black)
                })
                .sheet(isPresented: $imagePickerPresented, onDismiss: loadImage, content: {
                    ImagePicker(image: $selectedImage)
                })
            } else if let image = postImage {
                HStack(alignment: .top) {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 96, height: 96)
                        .clipped()
                    
                    TextField("Enter your capture...", text: $captionText)
                }
                .padding()
                
                Button(action: {
                    if let image = selectedImage {
                        viewModel.uploadPost(caption: captionText, image: image)
                    }
                }, label: {
                    Text("Share")
                        .font(.system(size: 16, weight: .semibold))
                        .frame(width: 360, height: 50)
                        .background(.blue)
                        .cornerRadius(5)
                        .foregroundColor(.white)
                })
                .padding()
            }
            
            Spacer()
        }
    }
}

extension UploadPostView {
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        postImage = Image(uiImage: selectedImage)
    }
}
