//
//  UserSession.swift
//  Play4Padel
//
//  Created by Carlos Gonzalez on 29/12/24.
//

import Foundation

struct UserSession: Codable {
    let userId: String
    let email: String?
    let fullName: PersonNameComponents?
}
