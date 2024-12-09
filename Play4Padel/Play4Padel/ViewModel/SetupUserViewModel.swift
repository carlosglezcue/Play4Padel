//
//  SetupUserViewModel.swift
//  Play4Padel
//
//  Created by Carlos Gonzalez on 30/11/24.
//

import SwiftUI

@MainActor
@Observable
final class SetupUserViewModel {
    
    // MARK: - Properties
    
    private let userDefaultsManager = UserDefaultsManager()
    
    var isPresented: Bool = false
    var screenType: SetupUserState = .welcome
    var selectedPositionType: PlayerPositionType = .both
    
    init() {
        Task {
            self.isPresented = await getSetupState()
        }
    }
    
    // MARK: - Functions
    
    private func savePlayerPosition(_ positionSelected: PlayerPositionType) async {
        await userDefaultsManager.set(positionSelected.rawValue, forKey: "playerPosition")
    }
    
    private func saveSetupSatate() async {
        await userDefaultsManager.set(true, forKey: "setupPresented")
    }
    
    private func getSetupState() async -> Bool {
        let value: Bool = await userDefaultsManager.get(forKey: "setupPresented") ?? false
        return value
    }
    
    private func closeSetup() async {
        isPresented = true
        await saveSetupSatate()
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
        Task { await savePlayerPosition(selectedPositionType) }
    }
}
