//
//  SetSectionView.swift
//  Play4Padel
//
//  Created by Carlos Gonzalez on 26/1/25.
//

import SwiftUI

struct SetSectionView: View {
    let playerNumber: String
    let backgroundColor: Color
    let scores: [Int]
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 8.0)
                    .fill(backgroundColor.opacity(0.25))
                    .frame(height: 35)
                
                Text(playerNumber)
                    .font(.callout)
                    .bold()
            }
            
            VStack {
                ForEach(0..<scores.count, id: \.self) { index in
                    if index > 0 {
                        Divider()
                    }
                    Text("\(scores[index])")
                }
            }
            .padding()
        }
    }
}
