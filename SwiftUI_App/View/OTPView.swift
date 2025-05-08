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

    var body: some View {
        VStack {
            Text("Enter OTP")
                .font(.largeTitle.bold())
                .vSpacing(.leading)
            
            HStack(spacing: 0) {
                ForEach(0 ..< 6, id: \.self) { index in
                    OTPTextBox(index)
                }
                
            }
            .background {
                TextField("", text: $otpText)

            }
            .padding(.bottom, 20)
            .padding(.top, 10)
            
            GradientButton(title: "Confirm", icon: "arrow.right") {
                dismiss()
            }
            .hSpacing(.trailing)
            .disableWithOpacity(otpText.count < 6)
        }
        .padding(.horizontal, 24)

    }
    
    @ViewBuilder
    func OTPTextBox(_ index: Int) -> some View {
        ZStack {
            if otpText.count > index {
                /// Finding char at index
                let startIndex = otpText.startIndex
                let charIndex = otpText.index(startIndex, offsetBy: index)
                let charToString = String(otpText[charIndex])
                Text(charToString)
            } else {
                Text(" ")
            }
        }
        .frame(width: 45, height: 45)
        .background {
            RoundedRectangle(cornerRadius: 6, style: .continuous)
                .stroke(.gray, lineWidth: 0.5)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    ContentView()
}
