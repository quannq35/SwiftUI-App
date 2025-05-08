//
//  SignUp.swift
//  SwiftUI_App
//
//  Created by Quân Nguyễn on 8/5/25.
//

import SwiftUI

struct SignUp: View {
    /// View Properties
    @State private var email: String = ""
    @State private var fullName: String = ""
    @State private var password: String = ""
    @Binding var showSignUp: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Button {
                showSignUp = false
            } label: {
                Image(systemName: "arrow.left")
                    .font(.title2)
                    .foregroundStyle(.gray)
            }
            .padding(.top, 10)

            
            Text("SignUp")
                .font(.largeTitle)
                .fontWeight(.heavy)
            
            Text("Please signup in to continue")
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundStyle(.gray)
                .padding(.top, -5)
            
            VStack(spacing: 25) {
                /// Custom TF
                CustomTF(sfIcon: "mail", hint: "Email", isPassword: false, value: $email)
                
                CustomTF(sfIcon: "person", hint: "FullName", isPassword: false, value: $fullName)
                    .padding(.top, 5)
                
                CustomTF(sfIcon: "lock", hint: "Password", isPassword: true, value: $password)
                    .padding(.top, 5)
                
               
                
                Button("Forgot Password?") {
                    
                }
                .font(.callout)
                .fontWeight(.heavy)
                .tint(.appYellow)
                .hSpacing(.trailing)
                
                /// Login Button
                GradientButton(title: "Continue", icon: "arrow.right") {
                    print("Clicked")
                }
                .hSpacing(.trailing)
                .disableWithOpacity(email.isEmpty || password.isEmpty || fullName.isEmpty)
            }
            .padding(.top, 20)
            
            Spacer(minLength: 0)
            
            HStack(spacing: 6) {
                Text("Dont have an account?")
                    .font(.callout)
                    .foregroundStyle(.gray)
                    
                Button("Sign Up") {
                    showSignUp = false
                }
                .font(.callout)
                .fontWeight(.bold)
                .tint(.appYellow)
            }
            .hSpacing()
  
                      }
        .padding(.vertical, 15)
        .padding(.horizontal, 25)
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    ContentView()
}
