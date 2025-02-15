//
//  PlayerPositionType.swift
//  Play4Padel
//
//  Created by Carlos Gonzalez on 8/12/24.
//

import SwiftUI

enum PlayerPositionType: LocalizedStringKey, Codable, CaseIterable, Identifiable {
    case backhand = "Backhand"
    case drive = "Drive"
    case both = "Both sides"
    case none = ""
    
    var id: Self { self }
}

extension PlayerPositionType {
    
    func toView() -> LocalizedStringKey {
        switch self {
            case .backhand: "Backhand"
            case .drive: "Drive"
            case .both: "Both sides"
            case .none: ""
        }
    }
    
    func toSave() -> String {
        switch self {
            case .backhand: "Backhand"
            case .drive: "Drive"
            case .both: "Both sides"
            case .none: ""
        }
    }
    
    func toData() -> PositionType {
        switch self {
            case .backhand: .backhand
            case .drive: .drive
            case .both: .both
            case .none: .none
        }
    }
}
