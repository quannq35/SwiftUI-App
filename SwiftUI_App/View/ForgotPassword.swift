//
//  ForgotPassword.swift
//  SwiftUI_App
//
//  Created by Quân Nguyễn on 8/5/25.
//

import SwiftUI

struct ForgotPassword: View {
    /// View Properties
    @State private var email: String = ""
    @Binding var showResetView: Bool
    
    @Environment(\.dismiss) private var dismiss
      
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Button {
                dismiss()
            } label: {
                Image(systemName: "arrow.left")
                    .font(.title2)
                    .foregroundStyle(.gray)
            }
            .padding(.top, 10)
            
            
            Text("Forgot Password")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding(.top, 5)
            
            Text("Please enter your email so that we can send the reset link")
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundStyle(.gray)
                .padding(.top, -5)
            
            VStack(spacing: 25) {
                /// Custom TF
                CustomTF(sfIcon: "mail", hint: "Email", isPassword: false, value: $email)
                
                
                /// Login Button
                GradientButton(title: "Send Link", icon: "arrow.right") {
                    Task {
                        dismiss()
                        try? await Task.sleep(for: .seconds(0.5))
                        showResetView = true
                    }
                }
                .hSpacing(.trailing)
                .disableWithOpacity(email.isEmpty)
            }
            .padding(.top, 20)
            
            Spacer(minLength: 0)
    
        }
        .padding(.vertical, 15)
        .padding(.horizontal, 25)
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    ContentView()
}
