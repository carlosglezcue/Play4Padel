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
    var userFirstSet: Int = .zero
    var userSecondSet: Int = .zero
    var userThirdSet: Int = .zero
    var rivalFirstSet: Int = .zero
    var rivalSecondSet: Int = .zero
    var rivalThirdSet: Int = .zero
    var dateInfo: Date = .now
    var courtTypeSelected: TypeCourt = .none
    var positionSelected: PlayerPositionType = .none
    var isVisible: Bool = true
    var errorToSave: Bool = false
    
    // MARK: - Functions
    
    private func getUserTotalGamesInMatch() -> Int {
        return userFirstSet + userSecondSet + userThirdSet
    }
    
    private func getRivalTotalGamesInMatch() -> Int {
        return rivalFirstSet + rivalSecondSet + rivalThirdSet
    }
    
    private func getVictory() -> Bool {
        return getUserTotalGamesInMatch() > getRivalTotalGamesInMatch()
    }
    
    private func saveMatchData(_ context: ModelContext) {
        let newMatchData = MatchData(
            id: UUID(),
            firstUserSet: userFirstSet,
            secondUserSet: userSecondSet,
            thirdUserSet: userThirdSet,
            totalUserGames: getUserTotalGamesInMatch(),
            firstRivalSet: rivalFirstSet,
            secondRivalSet: rivalSecondSet,
            thirdRivalSet: rivalThirdSet,
            totalRivalGames: getRivalTotalGamesInMatch(),
            isVictory: getVictory(),
            position: positionSelected.toData(),
            courtType: courtTypeSelected.toData()
        )
        
        context.insert(newMatchData)
        registerMatch = false
    }
    
    // MARK: - Actions
    
    func registerMatchAction() {
        registerMatch.toggle()
    }
    
    func saveMatchAction(_ context: ModelContext) {
        let firsSetCorrect: Bool = userFirstSet <= 7 && rivalFirstSet <= 7 && userFirstSet != rivalFirstSet
        let secondSetCorrect: Bool = userSecondSet <= 7 && rivalSecondSet <= 7 && userSecondSet != rivalSecondSet
        let thirdSetCorrect: Bool = userThirdSet <= 7 && rivalThirdSet <= 7
        let lastSetCorrect: Bool = userThirdSet != rivalThirdSet || (userThirdSet == .zero && rivalThirdSet == .zero)
        
        if firsSetCorrect && secondSetCorrect && thirdSetCorrect && lastSetCorrect {
            saveMatchData(context)
        } else {
            errorToSave = true
        }
    }
    
    func hideReminderAction() {
        isVisible.toggle()
    }
}
