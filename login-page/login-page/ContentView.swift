//
//  ContentView.swift
//  login-page
//
//  Created by Jeremy's Macbook Pro 16 on 6/25/20.
//  Copyright © 2020 Jeremy Tandjung. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var authFailed: Bool = false
    @State private var authSucceed: Bool = false
    @State private var editingMode: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                WelcomeText()
                UserImage()
                
                UsernameTexField(username: $username, editingMode: $editingMode)
                
                PasswordSecureField(password: $password)
                
                if authFailed {
                    Text("Information not correct. Try again.")
                        .offset(y: -10)
                        .foregroundColor(.red)
                }
                LoginButton(handler: Login)
                
            }
            .padding()
            if authSucceed {
                Text("Login Successful!")
                    .font(.headline)
                    .frame(width: 250, height: 80)
                    .background(Color.green)
                    .cornerRadius(20.0)
                    .foregroundColor(.white)
                    .animation(Animation.default)

            }
        }
        .offset(y: editingMode ? -150 : 0)
    }
    
    func Login() {
        if self.username == defUsername && self.password == defPassword {
            self.authSucceed = true
        } else {
            self.authFailed = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WelcomeText: View {
    var body: some View {
        Text("Welcome!")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 20)
    }
}

struct UserImage: View {
    var body: some View {
        Image("userImage")
            .resizable()
            .scaledToFill()
            .frame(width: 200.0, height: 200.0)
            .clipShape(Circle())
            .clipped()
            .padding(.bottom, 60)
    }
}

struct LoginButton: View {
    
    var handler: () -> Void
    
    var body: some View {
        Button(action: handler) {
            Text("LOGIN")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(width: 220, height: 60)
                .background(Color.green)
                .cornerRadius(15.0)
        }
    }
}

struct UsernameTexField: View {
    
    @Binding var username: String
    @Binding var editingMode: Bool
    
    var body: some View {
        TextField("Bruh", text: $username, onEditingChanged: { edit in
            if edit {
                self.editingMode = true
            } else {
                self.editingMode = false
            }
        })
            .padding()
//            .frame(width: 300.0, height: 50.0)
            .background(lightGreyColor)
            .cornerRadius(5.0)
            .offset(y: -20)
    }
}

struct PasswordSecureField: View {
    @Binding var password: String
    
    var body: some View {
        SecureField("Password", text: $password)
            .padding()
            //            .frame(width: 300.0, height: 50.0)
            .background(lightGreyColor)
            .cornerRadius(5.0)
            .offset(y: -10)
    }
}
