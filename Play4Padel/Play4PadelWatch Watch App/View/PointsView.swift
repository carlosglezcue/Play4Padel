//
//  PointsView.swift
//  PersonalProjectWatch Watch App
//
//  Created by Carlos Gonzalez on 12/10/24.
//

import SwiftUI

struct PointsView: View {
    
    @State private var viewModel = RegisterMatchViewModel()
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack {
                PointsSectionView(viewModel: viewModel, color: .principal, title: "Players", isPlayer: true)
                Text("-")
                    .font(.title)
                    .padding(.bottom, 20)
                PointsSectionView(viewModel: viewModel, color: .blue, title: "Rivals", isPlayer: false)
            }
            Spacer()
        }
        .padding(.horizontal)
    }
}

#Preview {
    PointsView()
}
