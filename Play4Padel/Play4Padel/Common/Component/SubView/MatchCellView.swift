//
//  MatchCellView.swift
//  Play4Padel
//
//  Created by Carlos Gonzalez on 7/11/24.
//

import SwiftUI

struct MatchCellView: View {
    
    @Binding var result: String
    @Binding var activity: String
    @Binding var date: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10.0)
                .stroke(.darkBlack, lineWidth: 1)
                .fill(.principal.opacity(0.7))
                .frame(height: 200)
            
            HStack {
                VStack(alignment: .leading) {
                    MatchSavedInfoComponent(
                        text: "Result:",
                        data: $result
                    )
                    .padding(.vertical)
                    
                    Rectangle()
                        .foregroundStyle(.onlyBlack)
                        .frame(height: 1)
                    
                    MatchSavedInfoComponent(
                        text: "Activity:",
                        data: $activity
                    )
                    .padding(.vertical)
                    
                    Rectangle()
                        .foregroundStyle(.onlyBlack)
                        .frame(height: 1)
                    
                    MatchSavedInfoComponent(
                        text: "Date:",
                        data: $date
                    )
                    .padding(.vertical)
                }
                .padding(.horizontal)
                
                Image(systemName: "chevron.right")
                    .foregroundStyle(.onlyBlack)
                Spacer()
            }
        }
    }
}

#Preview {
    MatchCellView(
        result: .constant(""),
        activity: .constant(""),
        date: .constant("")
    )
}
