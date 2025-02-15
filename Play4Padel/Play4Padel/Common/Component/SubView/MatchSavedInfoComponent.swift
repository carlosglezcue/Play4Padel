//
//  MatchSavedInfoComponent.swift
//  Play4Padel
//
//  Created by Carlos Gonzalez on 7/11/24.
//

import SwiftUI

struct MatchSavedInfoComponent: View {
    
    let text: LocalizedStringKey
    @Binding var data: String
    
    var body: some View {
        HStack {
            Text(text)
                .font(.callout)
                .bold()
                .foregroundStyle(.onlyBlack)
            Spacer()
            Text(data)
                .font(.callout)
                .foregroundStyle(.onlyBlack.opacity(0.8))
        }
    }
}
