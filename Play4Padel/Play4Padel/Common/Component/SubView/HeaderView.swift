//
//  HeaderView.swift
//  Play4Padel
//
//  Created by Carlos Gonzalez on 6/11/24.
//

import SwiftUI

struct HeaderView: View {
    
    let section: LocalizedStringKey
    let subsection: String
    
    var body: some View {
        HStack {
            Group {
                Text(section)
                + Text(subsection.isEmpty ? "" : " \(subsection),")
            }
            .font(.largeTitle)
            .bold()
            .foregroundStyle(.onlyBlack)
            .padding([.top, .leading])
            
            Spacer()
        }
        .frame(height: 75)
        .background(.principal)
    }
}

#Preview {
    HeaderView(
        section: "Hello",
        subsection: "Carlos"
    )
}
