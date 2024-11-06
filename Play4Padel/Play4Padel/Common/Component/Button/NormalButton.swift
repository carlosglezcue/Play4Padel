//
//  NormalButton.swift
//  Play4Padel
//
//  Created by Carlos Gonzalez on 2/11/24.
//

import SwiftUI

struct NormalButton: View {
    
    let buttonAction: () -> ()
    let title: String
    let width: CGFloat
    let style: ButtonStyle
    
    var body: some View {
        Button {
            buttonAction()
        } label: {
            Text(title)
                .font(style.fontType)
                .bold()
                .foregroundStyle(style.textColor)
                .frame(width: width, height: style.heightButton)
        }
        .tint(style.foregroundColor)
        .buttonStyle(.borderedProminent)
    }
}

#Preview {
    NormalButton(
        buttonAction: { },
        title: "Continue",
        width: 300,
        style: PrincipalButton()
    )
}
