//
//  SplashView.swift
//  Play4Padel
//
//  Created by Carlos Gonzalez on 9/12/24.
//

import SwiftUI

struct SplashView: View {
    
    @State private var isAnimating = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.principal)
                .ignoresSafeArea()
            
            Rectangle()
                .foregroundStyle(.white)
                .frame(width: 3000, height: 25)
                .ignoresSafeArea()
                .padding(.bottom, 500)
            
            Rectangle()
                .foregroundStyle(.white)
                .frame(width: 25)
                .ignoresSafeArea()
                .padding(.trailing, 200)
            
            Text("Play4Padel")
                .underline()
                .font(.system(size: 40, weight: .bold))
                .foregroundStyle(.onlyBlack)
                .padding(.leading, 120)
                .padding(.top, 200)
                .scaleEffect(isAnimating ? 1 : 0.5)
                .opacity(isAnimating ? 1 : 0)
                .onAppear {
                    withAnimation(.spring(response: 0.8, dampingFraction: 0.6)) {
                        isAnimating = true
                    }
                }
        }
    }
}

#Preview {
    SplashView()
}
