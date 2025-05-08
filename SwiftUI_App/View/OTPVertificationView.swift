//
//  OTPVertificationView.swift
//  SwiftUI_App
//
//  Created by Quan 's Macmini on 8/5/25.
//

import SwiftUI

struct OTPVertificationView: View {
    @Binding var otpText: String
    @FocusState var isKeyboardShowing: Bool
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0 ..< 6, id: \.self) { index in
                OTPTextBox(index)
            }
            
        }
        .background {
            TextField("", text: $otpText.limit(6))
                .focused($isKeyboardShowing)
                .frame(width: 1, height: 1)
                .blendMode(.screen)
                .opacity(0.000001)
                .keyboardType(.numberPad)
                .textContentType(.oneTimeCode)
        }
        .contentShape(Rectangle())
        .onTapGesture {
            isKeyboardShowing.toggle()
        }
        .padding(.bottom, 20)
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
