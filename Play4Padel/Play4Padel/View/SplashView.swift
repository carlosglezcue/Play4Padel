//
//  SplashView.swift
//  Play4Padel
//
//  Created by Carlos Gonzalez on 9/12/24.
//

import SwiftUI

struct SplashView: View {
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.principal)
                .ignoresSafeArea()
            
            Rectangle()
                .foregroundStyle(.white)
                .frame(width: 3000, height: 25)
                .ignoresSafeArea()
                .padding(.bottom, 400)
            
            Rectangle()
                .foregroundStyle(.white)
                .frame(width: 25)
                .ignoresSafeArea()
                .padding(.trailing, 200)
            
            Text("Play4Padel")
                .underline()
                .font(.largeTitle)
                .bold()
                .foregroundStyle(.onlyBlack)
                .padding(.leading, 100)
        }
    }
}

#Preview {
    SplashView()
}
