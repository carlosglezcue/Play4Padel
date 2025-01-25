//
//  HomeView.swift
//  PersonalProjectWatch Watch App
//
//  Created by Carlos Gonzalez on 12/10/24.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        VStack(spacing: 20) {
            Button {
                
            } label: {
                HStack(alignment: .firstTextBaseline) {
                    Image(systemName: "play.circle")
                    Text("Play match")
                        .font(.body)
                    
                    Spacer()
                }
                .padding(.horizontal)
            }
            .tint(.green)
            
            Button {
                
            } label: {
                HStack {
                    Image(systemName: "line.3.horizontal.decrease.circle")
                    Text("History")
                        .font(.body)
                    Spacer()
                }
                .padding(.horizontal)
            }
            .tint(.blue)
            
        }
        .padding()
    }
}

#Preview {
    HomeView()
}
