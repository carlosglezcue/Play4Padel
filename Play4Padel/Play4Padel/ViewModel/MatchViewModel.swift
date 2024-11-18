//
//  MatchViewModel.swift
//  Play4Padel
//
//  Created by Carlos Gonzalez on 2/11/24.
//

import SwiftUI

enum MatchSection: String, CaseIterable, Identifiable {
    case date = "Date"
    case wins = "Wins"
    case calories = "Calories"
    
    var id: Self { self }
}

@Observable
final class MatchViewModel {
    
    // MARK: - Properties
    var dataMatch: [MatchData] = []
    var selectedSection: MatchSection = .date
    
    // MARK: - Functions
    
    func getDataList(_ matchData: [MatchData]) -> [MatchData] {
        dataMatch = matchData
        switch selectedSection {
            case .date: return dataMatch.sorted { first, second in
                (first.date ?? Date()) > (second.date ?? Date())
            }
            case .wins: return dataMatch.filter { $0.isVictory == true }
            case .calories: return dataMatch.sorted { first, second in
                first.calories ?? 0 > second.calories ?? 0
            }
        }
    }
}
