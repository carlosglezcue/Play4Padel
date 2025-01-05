//
//  Constant.swift
//  Play4Padel
//
//  Created by Carlos Gonzalez on 29/12/24.
//

import Foundation

// MARK: - Structs

struct KeychainConstant {
    static let session = "session"
    static let playerPosition = "playerPosition"
}

struct UserDefaultsConstant {
    static let setupUser = "setupPresented"
}

// MARK: - Enums

enum MainScreenState {
    case login
    case setup
    case home
}

enum AuthState {
    case idle
    case authenticating
    case authenticated
    case failed(Error)
}

enum AuthError: LocalizedError {
    case invalidCredential
    
    var errorDescription: String? {
        switch self {
            case .invalidCredential:
                return "Invalid authentication credentials"
        }
    }
}
