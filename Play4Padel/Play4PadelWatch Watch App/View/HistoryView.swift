//
//  HistoryView.swift
//  PersonalProjectWatch Watch App
//
//  Created by Carlos Gonzalez on 12/10/24.
//

import SwiftUI
import SwiftData

struct HistoryView: View {
    
    @Query var dataMatch: [MatchData]
    @State private var viewModel = MatchViewModel()
    
    var body: some View {
        ScrollView {
            ForEach(viewModel.getDataList(dataMatch), id: \.id) { matchData in
                MatchSectionView(match: matchData)
            }
        }
    }
}

#Preview(traits: .sampleData) {
    HistoryView()
}
