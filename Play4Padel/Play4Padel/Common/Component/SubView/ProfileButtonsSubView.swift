//
//  ProfileButtonsSubView.swift
//  Play4Padel
//
//  Created by Carlos Gonzalez on 12/1/25.
//

import SwiftUI

struct ProfileButtonsSubView: View {
    
    let loadPrivacyAction: () -> Void
    let loadConditionsAction: () -> Void
    let closeSessionAction: () -> Void
    let removeAllDataAction: () -> Void
    
    var body: some View {
        LargeIconButton(
            title: "Policy Privacy",
            buttonAction: loadPrivacyAction
        )
        .padding(.top, 30)
        
        LargeIconButton(
            title: "Conditions & Terms",
            buttonAction: loadConditionsAction
        )
        .padding(.top, 10)
        
        NormalButton(
            buttonAction: closeSessionAction,
            title: "Close session",
            width: 300,
            style: CancelButton()
        )
        .padding(.top, 30)
        
        NormalButton(
            buttonAction: removeAllDataAction,
            title: "Remove all data",
            width: 300,
            style: DeleteButton()
        )
        .padding(.top, 10)
        
        Text("Version: \(Utils.getAppVersion())")
            .font(.caption2)
            .foregroundStyle(.secondary)
            .padding(.top, 5)
    }
}

#Preview {
    ProfileButtonsSubView(
        loadPrivacyAction: { },
        loadConditionsAction: { },
        closeSessionAction: { },
        removeAllDataAction: { }
    )
}

struct PadProfileButtonsSubView: View {
    
    let loadPrivacyAction: () -> Void
    let loadConditionsAction: () -> Void
    let closeSessionAction: () -> Void
    let removeAllDataAction: () -> Void
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                LargeIconButton(
                    title: "Policy Privacy",
                    buttonAction: loadPrivacyAction
                )
                .padding(.top, 30)
                
                LargeIconButton(
                    title: "Conditions & Terms",
                    buttonAction: loadConditionsAction
                )
                .padding(.top, 30)
            }
            
            HStack {
                
                NormalButton(
                    buttonAction: closeSessionAction,
                    title: "Close session",
                    width: 300,
                    style: CancelButton()
                )
                .padding(.top, 30)
                
                NormalButton(
                    buttonAction: removeAllDataAction,
                    title: "Remove all data",
                    width: 300,
                    style: DeleteButton()
                )
                .padding(.top, 30)
            }
            
            Text("Version: \(Utils.getAppVersion())")
                .font(.caption2)
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    PadProfileButtonsSubView(
        loadPrivacyAction: { },
        loadConditionsAction: { },
        closeSessionAction: { },
        removeAllDataAction: { }
    )
}
