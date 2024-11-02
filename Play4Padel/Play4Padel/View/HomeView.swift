//
//  HomeView.swift
//  Play4Padel
//
//  Created by Carlos Gonzalez on 2/11/24.
//

import SwiftUI

struct HomeView: View {
    
    @State private var viewModel = HomeViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Hello, ")
                    .font(.largeTitle)
                    .bold()
                    .padding(.leading)
                
                Spacer()
            }
            .padding(.bottom)
            .background(.principal)
            
            ScrollView {
                HStack {
                    Spacer()
                    
                    NormalButton(
                        action: { viewModel.registerMatchAction() },
                        title: "REGISTER MATCH",
                        width: 300,
                        style: PrincipalLargeButton()
                    )
                    
                    
                    
                    
                    Spacer()
                }
            }
            .padding(.top, 30)
            .scrollBounceBehavior(.basedOnSize)
            .fullScreenCover(isPresented: $viewModel.isRegister) {
                RegisterMatchView(
                    textInfo: .constant(""),
                    dateInfo: .constant(.now),
                    saveAction: { }
                )
            }
        }
    }
}

#Preview {
    HomeView()
}
