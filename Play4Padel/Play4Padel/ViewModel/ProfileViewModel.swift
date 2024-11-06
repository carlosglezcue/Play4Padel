//
//  ProfileViewModel.swift
//  Play4Padel
//
//  Created by Carlos Gonzalez on 2/11/24.
//

import SwiftUI

@Observable
final class ProfileViewModel {
    
    // MARK: - Properties
    
    var reedPrivacyPolicy: Bool = false
    var readTermsConditions: Bool = false
    
    // MARK: - Functions
    
    func getNickname() -> String {
        // TODO: Add logic to get the username saved
        return "Charlieglez"
    }
    
    func getImage() -> ImageResource? {
        // TODO: Add logic to get the image saved
        return nil
    }
    
    func gerPlayerPosition() -> String {
        // TODO: Add logic to get the position saved
        return "Backhand"
    }
    
    // MARK: - Actions
    
    func removeUserDataAction() {
        
    }
}
