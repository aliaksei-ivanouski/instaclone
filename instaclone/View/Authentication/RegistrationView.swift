//
//  RegistrationView.swift
//  instaclone
//
//  Created by Aliaksei Ivanouski on 06/05/2022.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var username = ""
    @State private var fullName = ""
    @State private var password = ""
    @State private var selectedImage: UIImage?
    @State private var image: Image?
    @State var imagePickerPresented = false
    @Environment(\.presentationMode) var mode
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    if let image = image {
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 140, height: 140)
                            .clipShape(Circle())
                    } else {
                        Button(action: { imagePickerPresented.toggle() }, label: {
                            Image("plus_circle")
                                .renderingMode(.template)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 140, height: 140)
                                .foregroundColor(.white)
                        })
                        .sheet(isPresented: $imagePickerPresented, onDismiss: loadImage, content: {
                            ImagePicker(image: $selectedImage)
                        })
                    }
                }
                .padding(.top, 44)
                .padding(.bottom, 20)
                
                VStack(spacing: 20) {
                    CustomTextField(text: $email, placeholder: Text("email..."), imageName: "envelope")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)
                    
                    CustomTextField(text: $username, placeholder: Text("username..."), imageName: "person")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)
                    
                    CustomTextField(text: $fullName, placeholder: Text("full name..."), imageName: "person")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)
                    
                    CustomSecureField(text: $password, placeholder: Text("password..."))
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)
                }
                
                Button(
                    action: {
                        viewModel.register(withEmail: email, password: password, image: selectedImage, fullName: fullName, username: username)
                    }, label: {
                        Text("Sign Up")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 360, height: 50)
                            .background(.purple)
                            .clipShape(Capsule())
                            .padding()
                    })
                
                Spacer()
                
                
                
                HStack {
                    Text("Already have an accont?")
                        .font(.system(size: 14))
                    
                    Button(
                        action: { mode.wrappedValue.dismiss() }, label: {
                            Text("Sign In")
                                .font(.system(size: 14, weight: .semibold))
                        })
                }
                .foregroundColor(.white)
                .padding(.bottom, 16)
            }
        }
    }
}

extension RegistrationView {
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        image = Image(uiImage: selectedImage)
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
