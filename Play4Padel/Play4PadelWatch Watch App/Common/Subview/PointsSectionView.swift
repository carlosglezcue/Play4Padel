//
//  PointsSectionView.swift
//  Play4Padel
//
//  Created by Carlos Gonzalez on 25/1/25.
//

import SwiftUI

struct PlayerPointsSection: View {
    let playerNumber: String
    let backgroundColor: Color
    let points: String
    let onPointScored: () -> Void
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10.0)
                .fill(backgroundColor.opacity(0.25))
                .frame(width: 60, height: 160)
            
            VStack {
                Text(playerNumber)
                    .font(.caption)
                
                Divider()
                Spacer()
                
                Text(points)
                    .font(.title2)
                
                Spacer()
                
                Button(action: onPointScored) {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 40)
                        .foregroundStyle(backgroundColor)
                }
                .buttonStyle(.plain)
            }
            .padding(.vertical)
        }
    }
}
