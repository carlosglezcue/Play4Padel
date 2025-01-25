//
//  ConfigurationView.swift
//  PersonalProjectWatch Watch App
//
//  Created by Carlos Gonzalez on 26/10/24.
//

import SwiftUI

struct ConfigurationView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("To track your movements, please place yourself at the point where the serve line joins the line that divides the track into two parts, and then, tap on the next button.")
                    .font(.caption2)
                
                Button {
                    
                } label: {
                    HStack {
                        Image(systemName: "dot.scope")
                        
                        Text("Ready")
                    }
                }
                .tint(.blue)
            }
        }
    }
}

#Preview {
    ConfigurationView()
}
