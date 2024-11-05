//
//  MatchInfoView.swift
//  Play4Padel
//
//  Created by Carlos Gonzalez on 4/11/24.
//

import SwiftUI

struct MatchInfoView: View {
    
    let firstSubsection: String
    let secondSubsection: String
    let thirdSubsection: String
    
    @Binding var firstData: String
    @Binding var secondData: String
    @Binding var thirdData: String
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                RoundedRectangle(cornerRadius: 10.0)
                    .stroke(Color.black, lineWidth: 1)
                    .background(Color.clear)
                    .frame(height: 200)
                
                VStack(alignment: .leading) {
                    MatchInfoComponent(
                        text: firstSubsection,
                        data: .constant(firstData)
                    )
                    .padding(.vertical)
                    
                    Rectangle()
                        .tint(.black)
                        .frame(height: 1)
                    
                    MatchInfoComponent(
                        text: secondSubsection,
                        data: .constant(secondData)
                    )
                    .padding(.vertical)
                    
                    Rectangle()
                        .tint(.black)
                        .frame(height: 1)
                    
                    MatchInfoComponent(
                        text: thirdSubsection,
                        data: .constant(thirdData)
                    )
                    .padding(.vertical)
                }
                .padding(.horizontal)
            }
        }
        .padding(.vertical)
    }
}
