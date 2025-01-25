//
//  PointsSectionView.swift
//  Play4Padel
//
//  Created by Carlos Gonzalez on 25/1/25.
//

import SwiftUI

struct PointsSectionView: View {
    
    let viewModel: RegisterMatchViewModel
    let color: Color
    let title: String
    let isPlayer: Bool
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10.0)
                .fill(color.opacity(0.25))
                .frame(width: 60, height: 160)
            
            VStack {
                Text(title)
                    .font(.caption)
                
                Spacer()
                
                Text(isPlayer ? viewModel.playerPoint.value : viewModel.rivalPoint.value)
                    .font(.title)
                
                Spacer()
                
                Button {
                    isPlayer ? viewModel.currentPointsPlayer(viewModel.playerPoint, viewModel.rivalPoint) :
                    viewModel.currentPointsRival(viewModel.rivalPoint, viewModel.playerPoint)
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 40)
                        .foregroundStyle(color)
                }
                .buttonStyle(.plain)
            }
            .padding(.vertical)
        }
    }
}
