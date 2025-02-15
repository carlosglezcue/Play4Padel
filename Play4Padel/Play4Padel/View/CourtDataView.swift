//
//  CourtDataView.swift
//  Play4Padel
//
//  Created by Carlos Gonzalez on 2/11/24.
//

import SwiftUI

struct CourtDataView: View {
    
    @Environment(\.dismiss) var dismiss
    let match: MatchData
    
    var body: some View {
        VStack {
            HStack(alignment: .lastTextBaseline) {                
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.backward.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 20)
                        .foregroundStyle(.black)
                        .shadow(color: .gray.opacity(0.5), radius: 5, y: 5)
                }
                
                Spacer()
                
                Text("Court Details")
                    .font(.title2)
                    .bold()
                    .foregroundStyle(.onlyBlack)
                    .padding(.top)
                
                Spacer()
            }
            .padding([.bottom, .horizontal])
            .background(.principal)
            
            PadelCourt2DView()
        }
        .navigationTitle("Court Details")
    }
}

#Preview {
    CourtDataView(
        match: MatchData(
            id: UUID(),
            date: .now,
            firstUserSet: 4,
            secondUserSet: 6,
            thirdUserSet: 6,
            totalUserGames: 16,
            firstRivalSet: 6,
            secondRivalSet: 3,
            thirdRivalSet: 3,
            totalRivalGames: 12,
            isVictory: true,
            position: .backhand,
            courtType: .indoor,
            calories: 1300,
            totalMatchTime: 5400.0
        )
    )
}
