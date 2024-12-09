//
//  FinishSetupSubView.swift
//  Play4Padel
//
//  Created by Carlos Gonzalez on 18/11/24.
//

import SwiftUI

struct FinishSetupSubView: View {
    
    let action: () -> ()
    
    var body: some View {
        Text("Let's go!")
            .font(.largeTitle)
            .bold()
            .padding(.bottom, 50)
        
        Text("Now it's time to enjoy your games and have everything under control. Go for the victory!")
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
    FinishSetupSubView(action: { })
}
