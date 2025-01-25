//
//  PointsType.swift
//  Play4Padel
//
//  Created by Carlos Gonzalez on 25/1/25.
//

enum PointsType {
    case fifteen
    case thirty
    case forty
    case advantage
    case zero
}

extension PointsType {
    var value: String {
        return switch self {
            case .fifteen: "15"
            case .thirty: "30"
            case .forty: "40"
            case .advantage: "ADV"
            case .zero: "0"
        }
    }
}
