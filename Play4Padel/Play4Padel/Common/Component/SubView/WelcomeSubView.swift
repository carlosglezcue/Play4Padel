//
//  WelcomeSubView.swift
//  Play4Padel
//
//  Created by Carlos Gonzalez on 18/11/24.
//

import SwiftUI

struct WelcomeSubView: View {
    
    let action: () -> ()
    
    var body: some View {
        Text("WELCOME!")
            .font(.largeTitle)
            .bold()
            .padding(.bottom, 50)
        
        Text("Thanks for using our App. \nLet's start with some configurations")
            .font(.body)
            .padding(.bottom, 50)
        
        Button {
            action()
        } label: {
            Text("Continue")
                .font(.body)
                .foregroundStyle(.white)
                .bold()
                .frame(maxWidth: .infinity)
        }
        .tint(.black)
        .buttonStyle(.borderedProminent)
    }
}
