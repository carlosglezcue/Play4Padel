//
//  MatchViewModel.swift
//  Play4Padel
//
//  Created by Carlos Gonzalez on 25/1/25.
//

import SwiftUI

@Observable
final class MatchViewModel {
    
    // MARK: - Properties
    
    var dataMatch: [MatchData] = []
    
    // MARK: - Functions
    
    func getDataList(_ matchData: [MatchData]) -> [MatchData] {
        dataMatch = matchData
        return dataMatch.sorted { first, second in
            (first.date ?? Date()) > (second.date ?? Date())
        }
    }
}
