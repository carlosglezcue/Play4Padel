//
//  CloseMatchView.swift
//  PersonalProjectWatch Watch App
//
//  Created by Carlos Gonzalez on 22/10/24.
//

import SwiftUI

struct CloseMatchView: View {
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) var dismiss
    let viewModel: RegisterMatchViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            Button {
                viewModel.pauseGameAction()
            } label: {
                HStack {
                    Image(systemName: "pause.circle")
                    Text("Pause")
                        .font(.title3)
                }
            }
            .tint(.principal)
            
            Button {
                viewModel.finishGameAction()
            } label: {
                HStack {
                    Image(systemName: "stop.circle")
                    Text("Finish")
                        .font(.title3)
                }
            }
            .tint(.red)
        }
        .confirmationDialog(
            "Have you finished the game?",
            isPresented: .constant(viewModel.isMatchFinished),
            titleVisibility: .visible
        ) {
            Button("Yes") {
                viewModel.saveGameAction(context)
                dismiss()
            }
            Button("No") {
                viewModel.cancelFinishGameAction()
            }
        }
    }
}

#Preview {
    CloseMatchView(viewModel: RegisterMatchViewModel())
}
