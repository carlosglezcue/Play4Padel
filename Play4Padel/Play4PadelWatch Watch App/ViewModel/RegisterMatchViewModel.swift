//
//  RegisterMatchViewModel.swift
//  Play4PadelWatch Watch App
//
//  Created by Carlos Gonzalez on 25/1/25.
//

import SwiftUI

@Observable
final class RegisterMatchViewModel {
    
    var isGoldenBall: Bool = false
    
    // MARK: - Match Points Properties
    
    var playerPoint: PointsType = .zero
    var rivalPoint: PointsType = .zero
    
    // MARK: - Current Set Properties
    
    private(set) var currentSetGamesPlayer: Int = 0
    private(set) var currentSetGamesRival: Int = 0
    
    // MARK: - Sets History
    
    private(set) var setScores: [(player: Int, rival: Int)] = [(0,0), (0,0), (0,0)]
    private(set) var currentSetNumber: Int = 0
    
    var firstSetPlayer: Int { setScores[0].player }
    var secondSetPlayer: Int { setScores[1].player }
    var thirdSetPlayer: Int { setScores[2].player }
    var firstSetRival: Int { setScores[0].rival }
    var secondSetRival: Int { setScores[1].rival }
    var thirdSetRival: Int { setScores[2].rival }
    
    // MARK: - Tie Break Properties
    
    private(set) var isTieBreak: Bool = false
    private(set) var tieBreakPointsPlayer: Int = 0
    private(set) var tieBreakPointsRival: Int = 0
    
    // MARK: - Points Management
    
    /// Updates the player's points based on the current game situation
    ///
    /// - Parameters:
    ///   - points: Current points of the player
    ///   - rival: Current points of the rival
    func currentPointsPlayer(_ points: PointsType, _ rival: PointsType) {
        if isTieBreak {
            tieBreakPointsPlayer += 1
            checkTieBreakWinner()
        } else {
            switch points.value {
                case "0": playerPoint = .fifteen
                case "15": playerPoint = .thirty
                case "30": playerPoint = .forty
                case rival.value:
                    if !isGoldenBall {
                        playerPoint = .advantage
                    } else {
                        incrementGame(for: .player)
                        resetPoints()
                    }
                case _ where rival.value == "ADV":
                    playerPoint = .forty
                    rivalPoint = .forty
                default:
                    incrementGame(for: .player)
                    resetPoints()
            }
        }
    }
    
    /// Updates the rival's points based on the current game situation
    ///
    /// - Parameters:
    ///   - points: Current points of the rival
    ///   - rival: Current points of the player
    func currentPointsRival(_ points: PointsType, _ rival: PointsType) {
        if isTieBreak {
            tieBreakPointsRival += 1
            checkTieBreakWinner()
        } else {
            switch points.value {
                case "0": rivalPoint = .fifteen
                case "15": rivalPoint = .thirty
                case "30": rivalPoint = .forty
                case rival.value:
                    if !isGoldenBall {
                        rivalPoint = .advantage
                    } else {
                        incrementGame(for: .rival)
                        resetPoints()
                    }
                case _ where rival.value == "ADV":
                    playerPoint = .forty
                    rivalPoint = .forty
                default:
                    incrementGame(for: .rival)
                    resetPoints()
            }
        }
    }
    
    // MARK: - Game Management
    
    /// Increments the game count for the specified player and updates the set score
    ///
    /// - Parameter player: The player type (.player or .rival) who won the game
    private func incrementGame(for player: PlayerType) {
        switch player {
            case .player:
                currentSetGamesPlayer += 1
                updateSetScore()
            case .rival:
                currentSetGamesRival += 1
                updateSetScore()
        }
        checkSetWinner()
    }
    
    /// Updates the current set score in the sets history
    private func updateSetScore() {
        setScores[currentSetNumber] = (currentSetGamesPlayer, currentSetGamesRival)
    }
    
    // MARK: - Set Management
    
    /// Checks if there's a winner for the current set
    private func checkSetWinner() {
        let gamesDifference = abs(currentSetGamesPlayer - currentSetGamesRival)
        
        if currentSetGamesPlayer >= 6 || currentSetGamesRival >= 6 {
            if gamesDifference >= 2 {
                if currentSetGamesPlayer > currentSetGamesRival {
                    incrementSet(for: .player)
                } else {
                    incrementSet(for: .rival)
                }
                resetSetGames()
            } else if currentSetGamesPlayer == 6 && currentSetGamesRival == 6 {
                isTieBreak = true
            }
        }
    }
    
    /// Checks if there's a winner in the current tie-break
    private func checkTieBreakWinner() {
        let pointsDifference = abs(tieBreakPointsPlayer - tieBreakPointsRival)
        
        if (tieBreakPointsPlayer >= 7 || tieBreakPointsRival >= 7) && pointsDifference >= 2 {
            if tieBreakPointsPlayer > tieBreakPointsRival {
                currentSetGamesPlayer += 1
                incrementSet(for: .player)
            } else {
                currentSetGamesRival += 1
                incrementSet(for: .rival)
            }
            resetTieBreak()
        }
    }
    
    /// Increments the set counter for the specified player
    ///
    /// - Parameter player: The player type (.player or .rival) who won the set
    private func incrementSet(for player: PlayerType) {
        if currentSetNumber < 2 {
            updateSetScore()
            currentSetNumber += 1
            resetSetGames()
            updateSetScore()
        }
    }
    
    // MARK: - Reset Methods
    
    /// Resets both players' points to zero
    private func resetPoints() {
        playerPoint = .zero
        rivalPoint = .zero
    }
    
    /// Resets the game counters for the current set to zero
    private func resetSetGames() {
        currentSetGamesPlayer = 0
        currentSetGamesRival = 0
    }
    
    /// Resets the tie-break state and points to initial values
    private func resetTieBreak() {
        isTieBreak = false
        tieBreakPointsPlayer = 0
        tieBreakPointsRival = 0
    }
}
