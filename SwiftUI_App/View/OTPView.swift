//
//  OTPView.swift
//  SwiftUI_App
//
//  Created by Quân Nguyễn on 8/5/25.
//

import SwiftUI

struct OTPView: View {
    
    @State var otpText: String = ""
    
    @Environment(\.dismiss) private var dismiss
    
    /// Keyboard State
    @FocusState private var isKeyboardShowing: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Button {
                dismiss()
            } label: {
                Image(systemName: "arrow.left")
                    .font(.title2)
                    .foregroundColor(.gray)
            }
            .padding(.top, 10)
                    
            Text("Enter OTP")
                .font(.largeTitle.bold())
                .vSpacing(.leading)
            
            Text("an 6 digit code has been sent to your email")
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundStyle(.gray)
                .padding(.top, -10)
            
            VStack(spacing: 25) {
                OTPVertificationView(otpText: $otpText)
                
                GradientButton(title: "Confirm", icon: "arrow.right") {
                    dismiss()
                }
                .hSpacing(.trailing)
                .disableWithOpacity(otpText.count < 6)
            }
            
            
            
            Spacer(minLength: 0)
              
        }
        .padding(.vertical, 15)
        .padding(.horizontal, 24)
        .interactiveDismissDisabled()

    }
}

extension Binding where Value == String {
    func limit(_ length: Int) -> Self {
        if self.wrappedValue.count > length {
            DispatchQueue.main.async {
                self.wrappedValue = String(self.wrappedValue.prefix(length))
            }
        }
        return self
    }
}

#Preview {
    ContentView()
}
