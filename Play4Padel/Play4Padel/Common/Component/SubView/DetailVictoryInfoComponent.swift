//
//  DetailVictoryInfoComponent.swift
//  Play4Padel
//
//  Created by Carlos Gonzalez on 10/11/24.
//

import SwiftUI

struct DetailVictoryInfoComponent: View {
    
    let dataType: String
    let isVictory: Bool
    
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 10.0)
                    .stroke(Color.black, lineWidth: 3)
                    .fill(isVictory ? .principal : .red)
                    .frame(width: 40, height: 40)
                
                Text(isVictory ? "W" : "L")
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
                    .fill(isVictory ? .red : .principal)
                    .frame(width: 40, height: 40)
                
                Text(isVictory ? "L" : "W")
                    .font(.callout)
                    .foregroundStyle(.onlyBlack)
            }
        }
        .padding(.horizontal, 30)
    }
}
