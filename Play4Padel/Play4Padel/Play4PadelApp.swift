//
//  Play4PadelApp.swift
//  Play4Padel
//
//  Created by Carlos Gonzalez on 2/11/24.
//

import SwiftUI
import SwiftData

@main
struct Play4PadelApp: App {
    
    @Environment(\.scenePhase) var scenePhase
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([MatchData.self])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            MainView()
                .overlay {
                    if scenePhase != .active {
                        SplashView()
                    }
                }
        }
        .modelContainer(sharedModelContainer)
    }
}
