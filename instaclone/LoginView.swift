//
//  LoginView.swift
//  instaclone
//
//  Created by Aliaksei Ivanouski on 06/05/2022.
//

import SwiftUI

struct LoginView: View {
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
                    
                    //email field
                    
                    //password field
                    
                    //forgot password
                    
                    //sign in
                    
                    // go to sign in
                    
                    Spacer()
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
