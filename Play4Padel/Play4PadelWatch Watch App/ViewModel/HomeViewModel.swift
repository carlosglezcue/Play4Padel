//
//  HomeViewModel.swift
//  Play4PadelWatch Watch App
//
//  Created by Carlos Gonzalez on 9/2/25.
//

import SwiftUI


@Observable
final class HomeViewModel {
    
    // MARK: - Properties
    
    private var healthKitManager = WorkoutManager()
    
    var showError: Bool = false
    var errorMessage: String = ""
    
    // MARK: - Functions
    
    func configureHome() async {
        do {
            let authorized = try await healthKitManager.requestAuthorization()
            if !authorized {
                errorMessage = "Not all necessary permissions have been granted. Please accept all necessary permissions if you want to register a match."
                showError = true
            }
        } catch {
            if let healthKitError = error as? HealthKitError {
                errorMessage = healthKitError.localizedDescription
            } else {
                errorMessage = error.localizedDescription
            }
            showError = true
        }
    }
}

