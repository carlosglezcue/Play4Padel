//
//  MatchData.swift
//  Play4Padel
//
//  Created by Carlos Gonzalez on 2/11/24.
//

import SwiftUI
import SwiftData

enum CourtType: String, Codable, CaseIterable, Identifiable {
    case indoor = "Indoor"
    case outdoor = "Outdoor"
    case none
    
    var id: Self { self }
}

enum PositionType: String, Codable, CaseIterable, Identifiable {
    case backhand = "Backhand"
    case drive = "Drive"
    case both = "Both sides"
    case none
    
    var id: Self { self }
}

@Model
final class MatchData {
    @Attribute(.unique) var id: UUID
    var date: Date?
    var firstUserSet: Int?
    var secondUserSet: Int?
    var thirdUserSet: Int?
    var totalUserGames: Int?
    var firstRivalSet: Int?
    var secondRivalSet: Int?
    var thirdRivalSet: Int?
    var totalRivalGames: Int?
    var isVictory: Bool?
    var position: PositionType?
    var courtType: CourtType?
    var calories: Double?
    var totalMatchTime: TimeInterval?
    var heartRate: Double?
    var distance: Double?
    
    init(
        id: UUID,
        date: Date? = nil,
        firstUserSet: Int? = nil,
        secondUserSet: Int? = nil,
        thirdUserSet: Int? = nil,
        totalUserGames: Int? = nil,
        firstRivalSet: Int? = nil,
        secondRivalSet: Int? = nil,
        thirdRivalSet: Int? = nil,
        totalRivalGames: Int? = nil,
        isVictory: Bool? = nil,
        position: PositionType? = nil,
        courtType: CourtType? = nil,
        calories: Double? = nil,
        totalMatchTime: TimeInterval? = nil,
        heartRate: Double? = nil,
        distance: Double? = nil
    ) {
        self.id = id
        self.date = date
        self.firstUserSet = firstUserSet
        self.secondUserSet = secondUserSet
        self.thirdUserSet = thirdUserSet
        self.totalUserGames = totalUserGames
        self.firstRivalSet = firstRivalSet
        self.secondRivalSet = secondRivalSet
        self.thirdRivalSet = thirdRivalSet
        self.totalRivalGames = totalRivalGames
        self.isVictory = isVictory
        self.position = position
        self.courtType = courtType
        self.calories = calories
        self.totalMatchTime = totalMatchTime
        self.heartRate = heartRate
        self.distance = distance
    }
}
