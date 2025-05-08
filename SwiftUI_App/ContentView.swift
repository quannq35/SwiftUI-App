//
//  ContentView.swift
//  SwiftUI_App
//
//  Created by Quân Nguyễn on 8/5/25.
//

import SwiftUI

struct ContentView: View {
    
    /// View properties
    @State private var showSignUp: Bool = false
    
    var body: some View {
        NavigationStack {
    
            Login(showSignUp: $showSignUp)
                .navigationDestination(isPresented: $showSignUp) {
                    SignUp(showSignUp: $showSignUp)
                    
                }
                .overlay {
                    if #available(iOS 17, *) {
                        CircleView().animation(.smooth(duration: 0.45, extraBounce: 0), value: showSignUp)
                    } else {
                        CircleView().animation(.easeInOut(duration: 0.3), value: showSignUp)
                    }
                    
                }
        }
    }
    
    @ViewBuilder
    func CircleView() -> some View {
        Circle()
            .fill(.linearGradient(colors: [.appYellow, .orange, .red], startPoint: .top, endPoint: .bottom))
            .frame(width: 200, height: 200)
            .offset(x: showSignUp ? 90 : -90, y: -90)
            .blur(radius: 15)
            .hSpacing(showSignUp ? .trailing : .leading)
            .vSpacing(.top)
    }
}

#Preview {
    ContentView()
}
