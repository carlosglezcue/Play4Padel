//
//  SetsViews.swift
//  PersonalProjectWatch Watch App
//
//  Created by Carlos Gonzalez on 22/10/24.
//

import SwiftUI

struct SetsViews: View {
    @Binding var viewModel: RegisterMatchViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Sets:")
                .underline()
                .bold()
            
            HStack(alignment: .firstTextBaseline) {
                SetSectionView(
                    playerNumber: "P1",
                    backgroundColor: .principal,
                    scores: [
                        viewModel.firstSetPlayer,
                        viewModel.secondSetPlayer,
                        viewModel.thirdSetPlayer
                    ]
                )
                .padding()
                
                Text("VS")
                    .font(.footnote)
                
                SetSectionView(
                    playerNumber: "P2",
                    backgroundColor: .blue,
                    scores: [
                        viewModel.firstSetRival,
                        viewModel.secondSetRival,
                        viewModel.thirdSetRival
                    ]
                )
                .padding()
            }
        }
        .id(viewModel.firstSetPlayer + viewModel.secondSetPlayer + viewModel.thirdSetPlayer)
    }
}

#Preview {
    SetsViews(viewModel: .constant(RegisterMatchViewModel()))
}
