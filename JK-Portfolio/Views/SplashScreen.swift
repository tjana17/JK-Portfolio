//
//  SplashScreen.swift
//  JK-Portfolio
//
//  Created by Janarthanan Kannan on 07/01/25.
//

import SwiftUI

struct SplashScreen: View {
    @State private var showHome: Bool = false
    var body: some View {
        VStack {
            LottieView(animationFileName: "jk", loopMode: .loop)
                            .frame(width: 300, height: 300)
                            .fullScreenCover(isPresented: $showHome, content: {
                                ContentView()
                                    .transition(.scale)
                            })
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.9) {
                showHome = true
            }
        }
    }
}

#Preview {
    SplashScreen()
}
