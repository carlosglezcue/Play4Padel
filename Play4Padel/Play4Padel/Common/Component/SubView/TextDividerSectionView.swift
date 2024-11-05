//
//  TextDividerSectionView.swift
//  Play4Padel
//
//  Created by Carlos Gonzalez on 4/11/24.
//

import SwiftUI

struct TextDividerSectionView: View {
    let title: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.title3)
            Spacer()
        }
    }
}
