//
//  HeaderView.swift
//  Play4Padel
//
//  Created by Carlos Gonzalez on 6/11/24.
//

import SwiftUI

struct HeaderView: View {
    
    let title: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.largeTitle)
                .bold()
                .padding(.leading)
            
            Spacer()
        }
        .padding(.bottom)
        .background(.principal)
    }
}

#Preview {
    HeaderView(
        title: "Hello"
    )
}
