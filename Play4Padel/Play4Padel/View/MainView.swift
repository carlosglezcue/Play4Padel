//
//  MainView.swift
//  Play4Padel
//
//  Created by Carlos Gonzalez on 8/12/24.
//

import SwiftUI

struct MainView: View {
    
    @State private var viewModel = SetupUserViewModel()
    @State private var isInitializing = true
    
    var body: some View {
        ZStack {
            if isInitializing {
                SplashView()
            } else if viewModel.isPresented {
                TabBarView()
                    .transition(.opacity)
            } else {
                SetupUserView(viewModel: $viewModel)
                    .transition(.opacity)
            }
        }
        .animation(.easeInOut, value: isInitializing)
        .onAppear {
            Task {
                try await Task.sleep(nanoseconds: 2000000000)
                isInitializing = false
            }
        }
    }
}

#Preview {
    MainView()
}
