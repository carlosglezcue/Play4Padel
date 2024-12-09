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
    
    private let userDefaultsManager = UserDefaultsManager()
    
    var reedPrivacyPolicy: Bool = false
    var readTermsConditions: Bool = false
    var showAlert: Bool = false
    var playerPosition: String = ""
    
    @MainActor
    init() {
        Task(priority: .background) {
            self.playerPosition = await getPlayerPosition()
        }
    }
    
    // MARK: - Functions
    
    func getNickname() -> String {
        // TODO: Add logic to get the username saved
        return "Charlieglez"
    }
    
    func getImage() -> ImageResource? {
        // TODO: Add logic to get the image saved
        return nil
    }
    
    func getPlayerPosition() async -> String {
        let value: String = await userDefaultsManager.get(forKey: "playerPosition") ?? ""
        return value
    }
    
    // MARK: - Actions
    
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
