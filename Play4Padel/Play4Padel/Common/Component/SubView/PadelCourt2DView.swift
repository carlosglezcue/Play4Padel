//
//  PadelCourt2DView.swift
//  Play4Padel
//
//  Created by Carlos Gonzalez on 10/11/24.
//

import SwiftUI

struct PadelCourt2DView: View {
    var body: some View {
        GeometryReader { geometry in
            let courtWidth = geometry.size.width * 0.9
            let courtHeight = courtWidth * 1.5  // Manteniendo proporciones 20x10
            
            ZStack {
                Rectangle()
                    .fill(Color.blue)
                    .frame(width: courtWidth, height: courtHeight)
                    .overlay(
                        Rectangle()
                            .stroke(Color.darkBlack, lineWidth: 3)
                    )
                
                Rectangle()
                    .fill(Color.white)
                    .frame(width: courtWidth, height: 4)
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                
                Rectangle()
                    .fill(Color.white)
                    .frame(width: courtWidth, height: 4)
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2 - courtHeight / 3)
                
                Rectangle()
                    .fill(Color.white)
                    .frame(width: courtWidth, height: 4)
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2 + courtHeight / 3)
                
                Rectangle()
                    .fill(Color.white)
                    .frame(width: 4, height: courtHeight * 0.7)
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

#Preview {
    PadelCourt2DView()
}
