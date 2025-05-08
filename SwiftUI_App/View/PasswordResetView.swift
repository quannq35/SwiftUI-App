//
//  PasswordResetView.swift
//  SwiftUI_App
//
//  Created by Quân Nguyễn on 8/5/25.
//

import SwiftUI

struct PasswordResetView: View {
    /// View Properties
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
    @Environment(\.dismiss) private var dismiss
      
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Button {
                dismiss()
            } label: {
                Image(systemName: "xmark")
                    .font(.title2)
                    .foregroundStyle(.gray)
            }
            .padding(.top, 10)
            
            
            Text("Resset Password")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding(.top, 5)
            

            VStack(spacing: 25) {
                /// Custom TF
                CustomTF(sfIcon: "lock", hint: "Password", isPassword: false, value: $password)
                CustomTF(sfIcon: "lock", hint: "Confirm Password", isPassword: false, value: $confirmPassword)
                    .padding(.top, 5)
                
                
                /// Login Button
                GradientButton(title: "Confirm", icon: "arrow.right") {
                    dismiss()
                }
                .hSpacing(.trailing)
                .disableWithOpacity(password.isEmpty || confirmPassword.isEmpty)
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
