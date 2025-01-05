//
//  ProfileViewModel.swift
//  Play4Padel
//
//  Created by Carlos Gonzalez on 2/11/24.
//

import SwiftUI
import SwiftData

@Observable
final class ProfileViewModel {
    
    // MARK: - Properties
    
    private let keychainManager = KeychainManager()
    
    var reedPrivacyPolicy: Bool = false
    var readTermsConditions: Bool = false
    var showAlert: Bool = false
    var playerPosition: String = ""
    var username: String = ""
    
    @MainActor
    init() {
        Task {
            username = try await getNickname()
            playerPosition = try await getPlayerPosition()
        }
    }
    
    // MARK: - Functions
    
    func getNickname() async throws -> String {
        let user: UserSession? = try await keychainManager.get(forKey: KeychainConstant.session)
        let username = user?.fullName?.nickname ?? .empty
        return username
    }
    
    func getImage() -> ImageResource? {
        // TODO: Add logic to get the image saved
        return nil
    }
    
    func getPlayerPosition() async throws -> String {
        let value: String = try await keychainManager.get(forKey: KeychainConstant.playerPosition) ?? ""
        return value
    }
    
    // MARK: - Actions
    
    @MainActor
    func closeSession() {
        Task {
            try await keychainManager.remove(forKey: KeychainConstant.session)
        }
    }
    
    func removeUserDataAction(_ context: ModelContext) {
        do {
            let matches = try context.fetch(FetchDescriptor<MatchData>())
            matches.forEach { context.delete($0) }
            try context.save()
        } catch {
            NSLog("Error to remove all data")
        }
    }
}
