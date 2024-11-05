//
//  HomeViewModel.swift
//  Play4Padel
//
//  Created by Carlos Gonzalez on 2/11/24.
//

import SwiftUI
import SwiftData

@Observable
final class HomeViewModel {
    
    // MARK: - Properties
    var registerMatch: Bool = false
    var userFirstSet: String = ""
    var userSecondSet: String = ""
    var userThirdSet: String = ""
    var rivalFirstSet: String = ""
    var rivalSecondSet: String = ""
    var rivalThirdSet: String = ""
    var dateInfo: Date = .now
    var courtTypeSelected: CourtType = .none
    var positionSelected: PositionType = .none
    var isVisible: Bool = true
    
    // MARK: - Functions
    
    private func getUserTotalGamesInMatch() -> Int {
        let firstSet = Int(userFirstSet)
        let secondSet = Int(userSecondSet)
        let thirdSet = Int(userThirdSet)
        guard let firstSet, let secondSet, let thirdSet else { return .zero }
        return firstSet + secondSet + thirdSet
    }
    
    private func getRivalTotalGamesInMatch() -> Int {
        let firstSet = Int(rivalFirstSet)
        let secondSet = Int(rivalSecondSet)
        let thirdSet = Int(rivalThirdSet)
        guard let firstSet, let secondSet, let thirdSet else { return .zero }
        return firstSet + secondSet + thirdSet
    }
    
    private func getVictory() -> Bool {
        return getUserTotalGamesInMatch() > getRivalTotalGamesInMatch()
    }
    
    // MARK: - Actions
    
    func registerMatchAction() {
        registerMatch.toggle()
    }
    
    func saveMatchDataAction(_ context: ModelContext) {
        let newMatchData = MatchData(
            id: UUID(),
            firstUserSet: Int(userFirstSet),
            secondUserSet: Int(userSecondSet),
            thirdUserSet: Int(userThirdSet),
            totalUserGames: getUserTotalGamesInMatch(),
            firstRivalSet: Int(rivalFirstSet),
            secondRivalSet: Int(rivalSecondSet),
            thirdRivalSet: Int(rivalThirdSet),
            totalRivalGames: getRivalTotalGamesInMatch(),
            isVictory: getVictory(),
            position: positionSelected,
            courtType: courtTypeSelected
        )
        
        context.insert(newMatchData)
    }
    
    func hideReminderAction() {
        isVisible.toggle()
    }
}
