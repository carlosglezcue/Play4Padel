//
//  MatchSectionView.swift
//  Play4Padel
//
//  Created by Carlos Gonzalez on 25/1/25.
//

import SwiftUI

struct MatchSectionView: View {
    
    let match: MatchData
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(match.isVictory == true ? .principal.opacity(0.20) : .red.opacity(0.20))
                .frame(height: 110)
                .padding(.vertical)
            
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text("Result:")
                        .font(.caption)
                        .bold()
                    
                    Spacer()
                    
                    Text(match.isVictory == true ? "W" : "L")
                        .font(.caption2)
                }
                .padding(.horizontal)
                
                HStack {
                    Text("Calories:")
                        .font(.caption)
                        .bold()
                    
                    Spacer()
                    
                    Text("\((match.calories ?? .zero).formattedWithoutDecimals)")
                        .font(.caption2)
                }
                .padding(.horizontal)
                
                HStack {
                    Text("Date:")
                        .font(.caption)
                        .bold()
                    
                    Spacer()
                    
                    Text(match.date?.formatted(date: .numeric, time: .omitted) ?? "-")
                        .font(.caption2)
                }
                .padding(.horizontal)
            }
        }
    }
}
