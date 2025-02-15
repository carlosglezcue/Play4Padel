//
//  Utils.swift
//  Play4Padel
//
//  Created by Carlos Gonzalez on 5/11/24.
//

import SwiftUI

struct Utils {
    
    static func getAppVersion() -> String {
        if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
            return version
        }
        return "Unknown"
    }
    
    
    // MARK: - Data match
    
    static func getResultMatch(_ matchData: MatchData) -> String {
        let firstSet = "\(matchData.firstUserSet ?? .zero)-\(matchData.firstRivalSet ?? .zero)"
        let secondSet = "\(matchData.secondUserSet ?? .zero)-\(matchData.secondRivalSet ?? .zero)"
        let thirdSet = "\(matchData.thirdUserSet ?? .zero)-\(matchData.thirdRivalSet ?? .zero)"
        
        return "\(firstSet) / \(secondSet) / \(thirdSet)"
    }
    
    static func getUserDataTotalGames(_ matchData: MatchData) -> Int {
        return (matchData.firstUserSet ?? .zero) + (matchData.secondUserSet ?? .zero) + (matchData.thirdUserSet ?? .zero)
    }
    
    static func getRivalDataTotalGames(_ matchData: MatchData) -> Int {
        return (matchData.firstRivalSet ?? .zero) + (matchData.secondRivalSet ?? .zero) + (matchData.thirdRivalSet ?? .zero)
    }
    
    static func getWinPercentageForFirstTenGames(_ matchData: [MatchData]) -> Double {
        let firstTenGames = Array(matchData.prefix(10))
        let totalWins = getTotalWins(firstTenGames)
        let totalGames = firstTenGames.count
        
        guard totalGames > 0 else { return 0.0 }
        
        return (Double(totalWins) / Double(totalGames)) * 100.0
    }
    
    static func getWinsForTenGames(_ matchData: [MatchData]) -> Int {
        let firstTenGames = Array(matchData.suffix(10))
        return firstTenGames.reduce(0) { $0 + (($1.isVictory ?? false) ? 1 : 0) }
    }
    
    static func getLosesForTenGames(_ matchData: [MatchData]) -> Int {
        let firstTenGames = Array(matchData.suffix(10))
        return firstTenGames.reduce(0) { $0 + (($1.isVictory ?? false) ? 0 : 1) }
    }
    
    static func getWinPercentage(_ matchData: [MatchData]) -> Double {
        let totalWins = getTotalWins(matchData)
        let totalGames = matchData.count
        
        guard totalGames > 0 else { return 0.0 }
        
        return (Double(totalWins) / Double(totalGames)) * 100.0
    }
    
    static func getTotalWins(_ matchData: [MatchData]) -> Int {
        return matchData.reduce(0) { $0 + (($1.isVictory ?? false) ? 1 : 0) }
    }
    
    static func getTotalLoses(_ matchData: [MatchData]) -> Int {
        return matchData.reduce(0) { $0 + (($1.isVictory ?? false) ? 0 : 1) }
    }
    
    static func getTotalCalories(_ matchData: MatchData) -> String {
        guard let calories = matchData.calories else { return .empty }
        
        let carloriesBurned = calories.formattedWithoutDecimals
        return carloriesBurned
    }
    
    static func getTotalMatchDuration(_ matchData: MatchData) -> String {
        guard let totalTime = matchData.totalMatchTime else { return .empty }
        let matchTime = totalTime / 60
        
        let totalDuration = matchTime.formattedWithoutDecimals
        return totalDuration
    }
}
