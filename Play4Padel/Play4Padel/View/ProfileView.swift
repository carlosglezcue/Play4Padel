//
//  ProfileView.swift
//  Play4Padel
//
//  Created by Carlos Gonzalez on 2/11/24.
//

import SwiftUI

struct ProfileView: View {
    
    @Binding var viewModel: UserViewModel
    @Environment(\.modelContext) private var context
    
    @DeviceIdiom private var deviceIdiom
    
    var body: some View {
        VStack {
            HeaderView(
                section: "My Profile",
                subsection: ""
            )
            
            VStack {
                if let image = viewModel.getImage() {
                    Image(image)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 200)
                        .padding(.top)
                        .clipShape(Circle())
                        .padding(.top)
                } else {
                    Image(systemName: "person.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 150)
                        .padding(.top)
                }
                
                Group {
                    HStack {
                        Text("Nickname:")
                            .font(.body)
                        Spacer()
                        Text(viewModel.username)
                            .font(.headline)
                    }
                    .padding(.top)
                    
                    HStack {
                        Text("Player Position:")
                            .font(.body)
                        Spacer()
                        Text(viewModel.playerPosition)
                            .font(.headline)
                    }
                    .padding(.top)
                }
                .padding(.horizontal, deviceIdiom == .pad ? 200 : 0)
                
                Spacer()
                
                if deviceIdiom == .pad {
                    PadProfileButtonsSubView(
                        loadPrivacyAction: { viewModel.reedPrivacyPolicy.toggle() },
                        loadConditionsAction: { viewModel.readTermsConditions.toggle() },
                        closeSessionAction: { viewModel.closeSession() },
                        removeAllDataAction: { viewModel.removeUserDataAction(context) }
                    )
                } else {
                    ProfileButtonsSubView(
                        loadPrivacyAction: { viewModel.reedPrivacyPolicy.toggle() },
                        loadConditionsAction: { viewModel.readTermsConditions.toggle() },
                        closeSessionAction: { viewModel.closeSession() },
                        removeAllDataAction: { viewModel.removeUserDataAction(context) }
                    )
                }
            }
            .padding(.bottom, 30)
            .padding(.horizontal, 35)
        }
        .sheet(isPresented: $viewModel.reedPrivacyPolicy) {
            PolicyPrivacyView()
        }
        .sheet(isPresented: $viewModel.readTermsConditions) {
            ConditionsAndTermsView()
        }
        .alert(
            "Are you sure you want to delete all your data?",
            isPresented: $viewModel.showAlert,
            actions: {
                Button("Cancel", role: .cancel) { }
                Button("Yes", role: .none) {
                    viewModel.removeUserDataAction(context)
                }
            },
            message: {
                Text("You will not be able to watch any added matches on any of the devices where you have the app installed.")
            }
        )
    }
}

#Preview {
    ProfileView(viewModel: .constant(UserViewModel()))
}
