//
//  UserViewModel.swift
//  Play4Padel
//
//  Created by Carlos Gonzalez on 30/11/24.
//

import SwiftUI
import AuthenticationServices
import SwiftData

@MainActor
@Observable
final class UserViewModel {
    
    // MARK: - Properties
    
    private(set) var authState: AuthState = .idle
    private let userDefaultsManager = UserDefaultsManager()
    private let keychain = KeychainManager()
    private var session: UserSession?
    
    var screenState: MainScreenState = .login
    var screenType: SetupUserState = .welcome
    var selectedPositionType: PlayerPositionType = .both
    var reedPrivacyPolicy: Bool = false
    var readTermsConditions: Bool = false
    var showAlert: Bool = false
    var playerPosition: String = ""
    var username: String = ""

    // MARK: - Functions
    
    func loadData() async throws {
        do {
            session = try await keychain.get(forKey: KeychainConstant.session)
            if session != nil {
                screenState = await getSetupState() ? .home : .setup
            } else {
                screenState = .login
            }
        } catch {
            screenState = .login
        }
    }
    
    private func savePlayerPosition(_ positionSelected: PlayerPositionType) async throws {
        try await keychain.set(positionSelected.rawValue, forKey: KeychainConstant.playerPosition)
    }
    
    private func saveSetupSatate() async {
        await userDefaultsManager.set(true, forKey: UserDefaultsConstant.setupUser)
    }
    
    private func getSetupState() async -> Bool {
        let value: Bool = await userDefaultsManager.get(forKey: UserDefaultsConstant.setupUser) ?? false
        return value
    }
    
    private func closeSetup() async {
        screenState = .home
        await saveSetupSatate()
    }
    
    func handleSignInWithAppleResult(_ result: Result<ASAuthorization, Error>) async {
        do {
            authState = .authenticating
            let auth = try result.get()
            
            guard let appleIDCredential = auth.credential as? ASAuthorizationAppleIDCredential else {
                throw AuthError.invalidCredential
            }
            
            // Extract user data
            let userId = appleIDCredential.user
            let email = appleIDCredential.email
            let fullName = appleIDCredential.fullName
            
            // Save session
            try await saveUserSession(userId: userId, email: email, fullName: fullName)
            screenState = .setup
            authState = .authenticated
            
        } catch {
            authState = .failed(error)
        }
    }
    
    private func saveUserSession(
        userId: String,
        email: String?,
        fullName: PersonNameComponents?
    ) async throws {
        let session = UserSession(
            userId: userId,
            email: email,
            fullName: fullName
        )
        try await keychain.set(session, forKey: KeychainConstant.session)
    }
    
    func getNickname() async throws -> String {
        let user: UserSession? = try await keychain.get(forKey: KeychainConstant.session)
        let username = user?.fullName?.nickname ?? .empty
        return username
    }
    
    func getImage() -> ImageResource? {
        // TODO: Add logic to get the image saved
        return nil
    }
    
    func getPlayerPosition() async throws -> String {
        let value: String = try await keychain.get(forKey: KeychainConstant.playerPosition) ?? ""
        return value
    }
    
    // MARK: - Actions
    
    func changeScreenTypeAction() {
        switch screenType {
            case .welcome:
                screenType = .position
            case .position:
                screenType = .finish
            case .finish:
                Task { await closeSetup() }
        }
    }
    
    func selectPositionAction(_ positionSelected: PlayerPositionType) {
        selectedPositionType = positionSelected
        changeScreenTypeAction()
        Task { try await savePlayerPosition(selectedPositionType) }
    }
    
    func closeSession() {
        Task {
            try await keychain.remove(forKey: KeychainConstant.session)
            screenState = .login
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
