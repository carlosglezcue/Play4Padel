//
//  Play4PadelWatchApp.swift
//  Play4PadelWatch Watch App
//
//  Created by Carlos Gonzalez on 25/1/25.
//

import SwiftUI
import SwiftData

@main
struct Play4PadelWatch_Watch_AppApp: App {
    
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
            HomeView()
        }
        .modelContainer(sharedModelContainer)
    }
}
