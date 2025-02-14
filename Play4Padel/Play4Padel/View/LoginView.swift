//
//  LoginView.swift
//  Play4Padel
//
//  Created by Carlos Gonzalez on 28/12/24.
//

import SwiftUI
import AuthenticationServices

struct LoginView: View {
    
    @Binding var viewModel: UserViewModel
    
    @DeviceIdiom private var deviceIdiom
    
    var body: some View {
        if deviceIdiom == .pad {
            LoginBigDeviceComponent(viewModel: viewModel)
        } else {
            LoginPhoneComponent(viewModel: viewModel)
        }   
    }
}

#Preview {
    LoginView(viewModel: .constant(UserViewModel()))
}
