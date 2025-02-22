//
//  NoMatchesView.swift
//  Play4Padel
//
//  Created by Carlos Gonzalez on 4/11/24.
//

import SwiftUI

struct NoMatchesView: View {
    
    let title: LocalizedStringKey
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10.0)
                .stroke(Color.darkBlack, lineWidth: 1)
                .background(Color.clear)
                .frame(height: 60)
            
            VStack {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.gray)
            }
        }
    }
}
