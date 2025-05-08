//
//  Login.swift
//  SwiftUI_App
//
//  Created by Quân Nguyễn on 8/5/25.
//

import SwiftUI

struct Login: View {
    /// View Properties
    @State private var email: String = ""
    @State private var password: String = ""
    
    /// Reset Password View (with New Password and Confirmation Password View)
    @State private var showResetView: Bool = false
    @State private var showForgotPasswordView: Bool = false
    @State private var showOTPView: Bool = false
    @Binding var showSignUp: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Spacer(minLength: 0)
            Text("Login")
                .font(.largeTitle)
                .fontWeight(.heavy)
            
            Text("Please sign in to continue")
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundStyle(.gray)
                .padding(.top, -5)
            
            VStack(spacing: 25) {
                /// Custom TF
                CustomTF(sfIcon: "at", hint: "Email", isPassword: false, value: $email)
                CustomTF(sfIcon: "lock", hint: "Password", isPassword: true, value: $password)
                    .padding(.top, 5)
                Button("Forgot Password?") {
                    showForgotPasswordView.toggle()
                }
                .font(.callout)
                .fontWeight(.heavy)
                .tint(.appYellow)
                .hSpacing(.trailing)
                
                /// Login Button
                GradientButton(title: "Login", icon: "arrow.right") {
                    showOTPView = true

                }
                .hSpacing(.trailing)
//                .disableWithOpacity(email.isEmpty || password.isEmpty)
            }
            .padding(.top, 20)
            
            Spacer(minLength: 0)
            
            HStack(spacing: 6) {
                Text("Already have an account?")
                    .font(.callout)
                    .foregroundStyle(.gray)
                    
                Button("Sign Up") {
                    showSignUp.toggle()
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
        .sheet(isPresented: $showForgotPasswordView) {
            if #available(iOS 16.4, *) {
                /// Since I wanted a Custom Sheet Corner Radius
                ForgotPassword(showResetView: $showResetView)
                    .presentationDetents([.height(350)])
                    .presentationCornerRadius(30)
            } else {
                ForgotPassword(showResetView: $showResetView)
                    .presentationDetents([.height(350)])
            }
        }
        
        .sheet(isPresented: $showResetView) {
            if #available(iOS 16.4, *) {
                /// Since I wanted a Custom Sheet Corner Radius
                PasswordResetView()
                    .presentationDetents([.height(350)])
                    .presentationCornerRadius(30)
            } else {
                PasswordResetView()
                    .presentationDetents([.height(350)])
            }
        }
        
        .sheet(isPresented: $showOTPView) {
            if #available(iOS 16.4, *) {
                /// Since I wanted a Custom Sheet Corner Radius
                OTPView()
                    .presentationDetents([.height(350)])
                    .presentationCornerRadius(30)
            } else {
                OTPView()
                    .presentationDetents([.height(350)])
            }
        }
    }
}

#Preview {
    ContentView()
}
