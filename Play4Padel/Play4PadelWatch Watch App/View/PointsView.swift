//
//  PointsView.swift
//  PersonalProjectWatch Watch App
//
//  Created by Carlos Gonzalez on 12/10/24.
//

import SwiftUI

struct PointsView: View {
    let viewModel: RegisterMatchViewModel
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack {
                PointsSection(
                    playerNumber: "P1",
                    backgroundColor: .principal,
                    points: viewModel.isTieBreak ? String(viewModel.tieBreakPointsPlayer) : viewModel.playerPoint.value,
                    isDisabled: viewModel.addPointsDisabled,
                    onPointScored: {
                        viewModel.currentPointsPlayerAction(viewModel.playerPoint, viewModel.rivalPoint)
                    }
                )
                .padding(.horizontal)
                
                Text("-")
                    .font(.title)
                    .padding(.bottom, 20)
                
                PointsSection(
                    playerNumber: "P2",
                    backgroundColor: .blue,
                    points: viewModel.isTieBreak ? String(viewModel.tieBreakPointsRival) : viewModel.rivalPoint.value,
                    isDisabled: viewModel.addPointsDisabled,
                    onPointScored: {
                        viewModel.currentPointsRivalAction(viewModel.rivalPoint, viewModel.playerPoint)
                    }
                )
                .padding(.horizontal)
            }
            Spacer()
        }
        .padding(.horizontal)
    }
}


#Preview {
    PointsView(viewModel: RegisterMatchViewModel())
}
