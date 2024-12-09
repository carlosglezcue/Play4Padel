//
//  ProfileView.swift
//  Play4Padel
//
//  Created by Carlos Gonzalez on 2/11/24.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var viewModel = ProfileViewModel()
    @Environment(\.modelContext) private var context
    
    var body: some View {
        VStack {
            HeaderView(
                title: "My Profile"
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
                
                HStack {
                    Text("Nickname:")
                        .font(.body)
                    Spacer()
                    Text(viewModel.getNickname())
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
                
                Spacer()
                
                LargeIconButton(
                    title: "Policy Privacy",
                    buttonAction: { viewModel.reedPrivacyPolicy.toggle() }
                )
                .padding(.top, 30)
                
                LargeIconButton(
                    title: "Conditions & Terms",
                    buttonAction: { viewModel.readTermsConditions.toggle() }
                )
                .padding(.top, 10)
                
                NormalButton(
                    buttonAction: { viewModel.showAlert.toggle() },
                    title: "Remove all data",
                    width: 300,
                    style: DeleteButton()
                )
                .padding(.top, 30)
                
                Text("Version: \(Utils.getAppVersion())")
                    .font(.caption2)
                    .foregroundStyle(.secondary)
                    .padding(.top, 5)
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
                Button("Cancel", role: .cancel) {}
                Button("Continue", role: .none) {
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
    ProfileView()
}
