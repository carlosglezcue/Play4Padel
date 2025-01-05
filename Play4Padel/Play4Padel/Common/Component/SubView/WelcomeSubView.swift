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
        Text("Thanks for using our App!")
            .font(.system(size: 20, weight: .bold))
            .padding(.bottom)
        
        Text("Let's start with some configurations")
            .font(.body)
            .padding(.bottom, 30)
        
        NormalButton(
            buttonAction: { action() },
            title: "Continue",
            width: 300,
            style: CancelButton()
        )
    }
}

#Preview {
    WelcomeSubView(action: { })
}
