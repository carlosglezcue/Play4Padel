//
//  SetupUserView.swift
//  Play4Padel
//
//  Created by Carlos Gonzalez on 18/11/24.
//

import SwiftUI

enum SetupUserState {
    case welcome
    case position
    case finish
}

struct SetupUserView: View {
    
    @Binding var viewModel: SetupUserViewModel
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.principal)
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                Spacer()
                Group {
                    switch viewModel.screenType {
                        case .welcome:
                            WelcomeSubView(
                                action: { withAnimation { viewModel.changeScreenTypeAction() } }
                            )
                            .transition(.opacity)
                        case .position:
                            SelectPositionSubView(
                                firstAction: { withAnimation { viewModel.selectPositionAction(.backhand) } },
                                secondAction: { withAnimation { viewModel.selectPositionAction(.drive) } },
                                thirdAction: { withAnimation { viewModel.selectPositionAction(.both) } }
                            )
                            .transition(.opacity)
                        case .finish:
                            FinishSetupSubView(
                                action: { withAnimation { viewModel.changeScreenTypeAction() }  }
                            )
                            .transition(.opacity)
                    }
                }
                Spacer()
            }
            .animation(.easeInOut, value: viewModel.screenType)
            .padding()
            .padding(.horizontal)
        }
    }
}

#Preview {
    SetupUserView(viewModel: .constant(SetupUserViewModel()))
}
