//
//  ConditionsAndTermsView.swift
//  Play4Padel
//
//  Created by Carlos Gonzalez on 6/11/24.
//

import SwiftUI

struct ConditionsAndTermsView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.principal.opacity(0.7))
            
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Conditions and Terms")
                        .font(.largeTitle)
                        .bold()
                        .padding(.vertical)
                    
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
                        .font(.callout)
                }
                .padding(.vertical)
                .padding(.horizontal, 30)
            }
            .scrollBounceBehavior(.basedOnSize)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ConditionsAndTermsView()
}
