//
//  MatchDetailViewModel.swift
//  Play4Padel
//
//  Created by Carlos Gonzalez on 9/11/24.
//

import SwiftUI

@Observable
class MatchDetailViewModel {
    
    // MARK: - Properties
    var match: MatchData
    
    init(match: MatchData) {
        self.match = match
    }
}
