//
//  CloseMatchView.swift
//  PersonalProjectWatch Watch App
//
//  Created by Carlos Gonzalez on 22/10/24.
//

import SwiftUI

struct CloseMatchView: View {
    
    var body: some View {
        VStack(spacing: 20) {
            Button {
                
            } label: {
                
                HStack {
                    Image(systemName: "pause.circle")
                    
                    Text("Pause")
                        .font(.title3)
                }
            }
            .tint(.principal)
            
            Button {
                
            } label: {
                
                HStack {
                    Image(systemName: "stop.circle")
                    
                    Text("Finish")
                        .font(.title3)
                }
            }
            .tint(.red)
        }
    }
}

#Preview {
    CloseMatchView()
}
