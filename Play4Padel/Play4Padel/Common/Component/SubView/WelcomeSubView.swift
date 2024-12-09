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
            .underline()
            .font(.system(size: 40, weight: .bold))
            .padding(.bottom, 50)
        
        Text("Thanks for using our App. \nLet's start with some configurations")
            .font(.body)
            .padding(.bottom, 50)
        
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
