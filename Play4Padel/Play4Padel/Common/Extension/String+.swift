//
//  String+.swift
//  Play4Padel
//
//  Created by Carlos Gonzalez on 4/11/24.
//

import Foundation

extension String {
    static let empty = ""
    
    var firstLetterUppercased: String {
        guard let firstLetter = self.first else { return .empty }
        let followingLetters = self.dropFirst()
        return String(firstLetter.uppercased()) + followingLetters.lowercased()
    }
}
