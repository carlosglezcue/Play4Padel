//
//  TypeCourt.swift
//  Play4Padel
//
//  Created by Carlos Gonzalez on 14/2/25.
//

import SwiftUI

enum TypeCourt: LocalizedStringKey, Codable, CaseIterable, Identifiable {
    case indoor = "Indoor"
    case outdoor = "Outdoor"
    case none
    
    var id: Self { self }
}

extension TypeCourt {
    
    func toView() -> LocalizedStringKey {
        switch self {
            case .indoor: "Indoor"
            case .outdoor: "Outdoor"
            case .none: ""
        }
    }
    
    func toData() -> CourtType {
        switch self {
            case .indoor:
                return .indoor
            case .outdoor:
                return .outdoor
            case .none:
                return .none
        }
    }
}
