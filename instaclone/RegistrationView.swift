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
    @Environment(\.presentationMode) var mode
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                Button(action: {}, label: {
                    Image("plus_circle")
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 140, height: 140)
                        .foregroundColor(.white)
                })
                .padding()
                
                VStack(spacing: 20) {
                    CustomTextField(text: $email, placeholder: Text("email..."), imageName: "envelope")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)
                    
                    CustomTextField(text: $email, placeholder: Text("username..."), imageName: "person")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)
                    
                    CustomTextField(text: $email, placeholder: Text("full name..."), imageName: "person")
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
                    action: {}, label: {
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

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
