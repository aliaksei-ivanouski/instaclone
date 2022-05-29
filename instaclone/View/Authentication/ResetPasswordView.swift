//
//  ResetPasswordView.swift
//  instaclone
//
//  Created by Aliaksei Ivanouski on 06/05/2022.
//

import SwiftUI

struct ResetPasswordView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @Environment(\.presentationMode) var mode
    @Binding private var email: String
    
    init(email: Binding<String>) {
        self._email = email
    }
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                Text(" camal ")
                    .font(Font.custom("KaushanScript-Regular", size: 90))
                    .foregroundColor(.white)
                    .frame(width: 320, height: 100)
                    .padding(.bottom, 30)
                
                VStack(spacing: 20) {
                    CustomTextField(text: $email, placeholder: Text("email..."), imageName: "envelope")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)
                }
                
                Button(action: {
                    viewModel.resetPassword(withEmail: email)
                }, label: {
                    Text("Send reset password link")
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
                        action: {
                            mode.wrappedValue.dismiss()
                        }, label: {
                            Text("Sign In")
                                .font(.system(size: 14, weight: .semibold))
                        })
                }
                .foregroundColor(.white)
                .padding(.bottom, 16)
            }
            .padding(.top, -44)
        }
        .onReceive(viewModel.$didSendResetPasswordLink, perform: { _ in
            self.mode.wrappedValue.dismiss()
        })
    }
}
