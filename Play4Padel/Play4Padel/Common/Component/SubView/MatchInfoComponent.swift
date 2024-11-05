//
//  MatchInfoComponent.swift
//  Play4Padel
//
//  Created by Carlos Gonzalez on 4/11/24.
//

import SwiftUI

struct MatchInfoComponent: View {
    
    let text: String
    @Binding var data: String
    
    var body: some View {
        HStack {
            Text(text)
                .font(.callout)
            Spacer()
            Text(data)
                .font(.callout)
                .foregroundStyle(.secondary)
        }
    }
}
