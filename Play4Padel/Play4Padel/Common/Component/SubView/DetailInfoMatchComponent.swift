//
//  DetailInfoMatchComponent.swift
//  Play4Padel
//
//  Created by Carlos Gonzalez on 9/11/24.
//

import SwiftUI

struct DetailInfoMatchComponent: View {
    
    let dataType: String
    let teamData: Int
    let rivalData: Int
    
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 10.0)
                    .stroke(Color.black, lineWidth: 3)
                    .fill(teamData > rivalData ? .principal : .red)
                    .frame(width: 40, height: 40)
                
                Text("\(teamData)")
                    .font(.callout)
                    .foregroundStyle(.onlyBlack)
            }
            
            Spacer()
            
            Text(dataType)
                .underline()
                .font(.body)
            
            Spacer()
            
            ZStack {
                RoundedRectangle(cornerRadius: 10.0)
                    .stroke(Color.black, lineWidth: 3)
                    .fill(rivalData > teamData ? .principal : .red)
                    .frame(width: 40, height: 40)
                
                Text("\(rivalData)")
                    .font(.callout)
                    .foregroundStyle(.onlyBlack)
            }
        }
        .padding(.horizontal, 30)
    }
}
