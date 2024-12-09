//
//  SelectPositionSubView.swift
//  Play4Padel
//
//  Created by Carlos Gonzalez on 18/11/24.
//

import SwiftUI

struct SelectPositionSubView: View {
    
    let firstAction: () -> ()
    let secondAction: () -> ()
    let thirdAction: () -> ()
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .frame(height: 400)
            
            VStack(alignment: .center) {
                Text("Tell us what's your position as player:")
                    .font(.body)
                    .bold()
                    .foregroundStyle(.white)
                    .padding(.bottom, 40)
                
                NormalButton(
                    buttonAction: { firstAction() },
                    title: "Backhand",
                    width: 200,
                    style: PrincipalButton()
                )
                .padding(.vertical)
                
                NormalButton(
                    buttonAction: { secondAction() },
                    title: "Drive",
                    width: 200,
                    style: PrincipalButton()
                )
                .padding(.bottom)
                
                NormalButton(
                    buttonAction: { thirdAction() },
                    title: "Both sides",
                    width: 200,
                    style: PrincipalButton()
                )
            }
            .padding(30)
        }
    }
}

#Preview {
    SelectPositionSubView(
        firstAction: { },
        secondAction: { },
        thirdAction: { }
    )
}
