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
    
    func getResultMatch(_ matchData: MatchData) -> String {
        let firstSet = "\(matchData.firstUserSet ?? .zero)-\(matchData.firstRivalSet ?? .zero)"
        let secondSet = "\(matchData.secondUserSet ?? .zero)-\(matchData.secondRivalSet ?? .zero)"
        let thirdSet = "\(matchData.thirdUserSet ?? .zero)-\(matchData.thirdRivalSet ?? .zero)"
        
        return "\(firstSet) / \(secondSet) / \(thirdSet)"
    }
    
    func getUserDataTotalGames(_ matchData: MatchData) -> Int {
        return (matchData.firstUserSet ?? .zero) + (matchData.secondUserSet ?? .zero) + (matchData.thirdUserSet ?? .zero)
    }
    
    func getWinPercentageForFirstTenGames(_ matchData: [MatchData]) -> Double {
        let firstTenGames = Array(matchData.prefix(10))
        let totalWins = getTotalWins(firstTenGames)
        let totalGames = firstTenGames.count
        
        guard totalGames > 0 else { return 0.0 }
        
        return (Double(totalWins) / Double(totalGames)) * 100.0
    }
    
    func getTotalWinsForFirstTenGames(_ matchData: [MatchData]) -> Int {
        let firstTenGames = Array(matchData.prefix(10))
        return firstTenGames.reduce(0) { $0 + (($1.isVictory ?? false) ? 1 : 0) }
    }
    
    func getTotalLosesForFirstTenGames(_ matchData: [MatchData]) -> Int {
        let firstTenGames = Array(matchData.prefix(10))
        return firstTenGames.reduce(0) { $0 + (($1.isVictory ?? false) ? 0 : 1) }
    }
    
    func getWinPercentage(_ matchData: [MatchData]) -> Double {
        let totalWins = getTotalWins(matchData)
        let totalGames = matchData.count
        
        guard totalGames > 0 else { return 0.0 }
        
        return (Double(totalWins) / Double(totalGames)) * 100.0
    }
    
    func getTotalWins(_ matchData: [MatchData]) -> Int {
        return matchData.reduce(0) { $0 + (($1.isVictory ?? false) ? 1 : 0) }
    }
    
    func getTotalLoses(_ matchData: [MatchData]) -> Int {
        return matchData.reduce(0) { $0 + (($1.isVictory ?? false) ? 0 : 1) }
    }
    
    private func getUserTotalGamesInMatch() -> Int {
        let firstSet = Int(userFirstSet)
        let secondSet = Int(userSecondSet)
        let thirdSet = Int(userThirdSet)
        guard let firstSet, let secondSet, let thirdSet else { return .zero }
        return firstSet + secondSet + thirdSet
    }
    
    private func getVictory() -> Bool {
        return getUserTotalGamesInMatch() > getRivalTotalGamesInMatch()
    }
    
    private func getRivalTotalGamesInMatch() -> Int {
        let firstSet = Int(rivalFirstSet)
        let secondSet = Int(rivalSecondSet)
        let thirdSet = Int(rivalThirdSet)
        guard let firstSet, let secondSet, let thirdSet else { return .zero }
        return firstSet + secondSet + thirdSet
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
