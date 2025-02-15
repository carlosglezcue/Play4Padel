//
//  LargeIconButton.swift
//  Play4Padel
//
//  Created by Carlos Gonzalez on 6/11/24.
//

import SwiftUI

struct LargeIconButton: View {
    
    let title: LocalizedStringKey
    let buttonAction: () -> ()
    
    var body: some View {
        Button {
            buttonAction()
        } label: {
            HStack(alignment: .center) {
                Text(title)
                    .font(.body)
                    .foregroundStyle(.black)
                Spacer()
                Image(systemName: "chevron.right.circle.fill")
                    .foregroundStyle(.black)
            }
            .frame(width: 300)
        }
        .tint(.principal)
        .buttonStyle(.borderedProminent)
    }
}

#Preview {
    LargeIconButton(
        title: "Policy Privacy",
        buttonAction: { }
    )
}
