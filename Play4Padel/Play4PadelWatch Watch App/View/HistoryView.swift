//
//  HistoryView.swift
//  PersonalProjectWatch Watch App
//
//  Created by Carlos Gonzalez on 12/10/24.
//

import SwiftUI

struct HistoryView: View {
    
    @State var date: String
    @State var result: String
    @State var isVictory: Bool
    
    var body: some View {
        ScrollView {
            ForEach(0..<5) { index in
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.principal.opacity(0.20))
                        .frame(width: .infinity, height: 110)
                        .padding(.vertical)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Text("Result:")
                                .font(.caption)
                                .bold()
                            
                            Spacer()
                            
                            Text("W")
                                .font(.caption2)
                        }
                        .padding(.horizontal)
                        
                        HStack {
                            Text("Activity:")
                                .font(.caption)
                                .bold()
                            
                            Spacer()
                            
                            Text("900kcal")
                                .font(.caption2)
                        }
                        .padding(.horizontal)
                        
                        HStack {
                            Text("Date:")
                                .font(.caption)
                                .bold()
                            
                            Spacer()
                            
                            Text("12/10/24")
                                .font(.caption2)
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
    }
}

#Preview {
    HistoryView(
        date: "12/10/2024",
        result: "6-1 / 3-6 / 6-4",
        isVictory: true
    )
}
