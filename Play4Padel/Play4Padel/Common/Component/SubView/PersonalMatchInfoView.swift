//
//  PersonalMatchInfoView.swift
//  Play4Padel
//
//  Created by Carlos Gonzalez on 9/11/24.
//

import SwiftUI

struct PersonalMatchInfoView: View {
    
    let firstData: String
    let secondData: String
    let thirdData: String
    let match: MatchData
    
    @State var viewCourt: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Personal Data:")
                .underline()
                .font(.body)
                .bold()
            
            ZStack {
                RoundedRectangle(cornerRadius: 10.0)
                    .stroke(Color.darkBlack, lineWidth: 1)
                    .background(Color.clear)
                    .frame(height: 250)
                
                VStack(alignment: .leading) {
                    MatchInfoComponent(
                        text: "Calories:",
                        data: .constant(firstData)
                    )
                    .padding(.vertical)
                    
                    Rectangle()
                        .tint(.black)
                        .frame(height: 1)
                    
                    MatchInfoComponent(
                        text: "Heart Rate:",
                        data: .constant(secondData)
                    )
                    .padding(.vertical)
                    
                    Rectangle()
                        .tint(.black)
                        .frame(height: 1)
                    
                    MatchInfoComponent(
                        text: "Distance:",
                        data: .constant(thirdData)
                    )
                    .padding(.vertical)
                    
                    HStack {
                        Spacer()
                        
                        Button {
                            viewCourt.toggle()
                        } label: {
                            Text("View on court")
                                .font(.callout)
                                .bold()
                                .foregroundStyle(.black)
                        }
                        .tint(.principal)
                        .buttonStyle(.borderedProminent)
                    }
                }
                .padding(.horizontal)
            }
        }
        .padding(.vertical)
        .fullScreenCover(isPresented: $viewCourt) {
            CourtDataView(match: match)
        }
    }
}
