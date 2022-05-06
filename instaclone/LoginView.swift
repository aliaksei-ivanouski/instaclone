//
//  LoginView.swift
//  instaclone
//
//  Created by Aliaksei Ivanouski on 06/05/2022.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationView {
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
                        
                        CustomSecureField(text: $password, placeholder: Text("password..."))
                            .padding()
                            .background(Color(.init(white: 1, alpha: 0.15)))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .padding(.horizontal, 32)
                    }
                    
                    HStack {
                        Spacer()
                        
                        Button(action: {}, label: {
                            Text("Forgot password?")
                                .font(.system(size: 13, weight: .semibold))
                                .foregroundColor(.white)
                                .padding(.top)
                                .padding(.trailing, 28)
                        })
                    }
                    
                    Button(action: {}, label: {
                        Text("Sign In")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 360, height: 50)
                            .background(.purple)
                            .clipShape(Capsule())
                            .padding()
                    })
                    
                    Spacer()
                    
                
                    
                    HStack {
                        Text("Do not have an accont?")
                            .font(.system(size: 14))
                        
                        NavigationLink(
                            destination: RegistrationView(),
                            label: {
                                Text("Sign Up")
                                    .font(.system(size: 14, weight: .semibold))
                            })
                    }
                    .foregroundColor(.white)
                    .padding(.bottom, 16)
                }
                .padding(.top, -44)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
