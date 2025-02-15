//
//  SplashView.swift
//  Play4Padel
//
//  Created by Carlos Gonzalez on 9/12/24.
//

import SwiftUI

struct SplashView: View {
    
    @State private var isAnimating = false
    
    @DeviceIdiom private var deviceIdiom
    
    var body: some View {
        if deviceIdiom == .pad {
            SplashBigDeviceComponent()
        } else {
            SplashPhoneComponent()
        }
    }
}

#Preview {
    SplashView()
}
