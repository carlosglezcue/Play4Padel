//
//  MainView.swift
//  Play4Padel
//
//  Created by Carlos Gonzalez on 8/12/24.
//

import SwiftUI

struct MainView: View {
    
    @State private var viewModel = UserViewModel()
    @State private var isInitializing = true
    
    var body: some View {
        ZStack {
            if isInitializing {
                SplashView()
            } else {
                switch viewModel.screenState {
                    case .login:
                        LoginView(viewModel: $viewModel)
                            .transition(.opacity)
                    case .setup:
                        SetupUserView(viewModel: $viewModel)
                            .transition(.opacity)
                    case .home:
                        TabBarView(viewModel: $viewModel)
                            .transition(.opacity)
                }
            }
        }
        .animation(.easeInOut, value: isInitializing)
        .onAppear {
            Task {
                try await viewModel.loadData()
                try await Task.sleep(nanoseconds: 2000000000)
                isInitializing = false
            }
        }
    }
}

#Preview(traits: .sampleData) {
    MainView()
}
