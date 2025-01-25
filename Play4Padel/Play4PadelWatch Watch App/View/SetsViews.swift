//
//  SetsViews.swift
//  PersonalProjectWatch Watch App
//
//  Created by Carlos Gonzalez on 22/10/24.
//

import SwiftUI

struct SetsViews: View {
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("Players:")
                    .underline()
                    .font(.body)
                    .bold()
                
                HStack(spacing: 20) {
                    Text("Sets:")
                        .bold()
                    
                    Text("0")
                    
                    Text("0")
                    
                    Text("0")
                }
                
                Spacer()
                
                Text("Rivals:")
                    .underline()
                    .font(.body)
                    .bold()
                
                HStack(spacing: 20) {
                    Text("Sets:")
                        .bold()
                    
                    Text("0")
                    
                    Text("0")
                    
                    Text("0")
                    
                }
            }
        }
    }
}

#Preview {
    SetsViews()
}
