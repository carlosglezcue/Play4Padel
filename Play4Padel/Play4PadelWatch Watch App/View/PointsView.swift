//
//  PointsView.swift
//  PersonalProjectWatch Watch App
//
//  Created by Carlos Gonzalez on 12/10/24.
//

import SwiftUI

struct PointsView: View {
    @Binding var viewModel: RegisterMatchViewModel
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack {
                PlayerPointsSection(
                    playerNumber: "P1",
                    backgroundColor: .principal,
                    points: viewModel.isTieBreak ? String(viewModel.tieBreakPointsPlayer) : viewModel.playerPoint.value,
                    onPointScored: {
                        viewModel.currentPointsPlayer(viewModel.playerPoint, viewModel.rivalPoint)
                    }
                )
                .padding(.horizontal)
                
                Text("-")
                    .font(.title)
                    .padding(.bottom, 20)
                
                PlayerPointsSection(
                    playerNumber: "P2",
                    backgroundColor: .blue,
                    points: viewModel.isTieBreak ? String(viewModel.tieBreakPointsRival) : viewModel.rivalPoint.value,
                    onPointScored: {
                        viewModel.currentPointsRival(viewModel.rivalPoint, viewModel.playerPoint)
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
    PointsView(viewModel: .constant(RegisterMatchViewModel()))
}
