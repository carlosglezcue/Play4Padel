//
//  LoginComponentView.swift
//  Play4Padel
//
//  Created by Carlos Gonzalez on 18/1/25.
//

import SwiftUI
import AuthenticationServices

struct LoginPhoneComponent: View {
    
    @Binding var viewModel: UserViewModel
    @State private var isAnimating = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.principal)
                .ignoresSafeArea()
            
            Rectangle()
                .foregroundStyle(.white)
                .frame(width: 3000, height: 25)
                .padding(.bottom, 600)
            
            Rectangle()
                .foregroundStyle(.white)
                .frame(width: 25, height: 3000)
                .padding(.trailing, 300)
            
            VStack {
                Text("WELCOME!")
                    .font(.system(size: 30, weight: .bold))
                    .padding(.bottom, 70)
                
                SignInWithAppleButton(.signIn) { request in
                    request.requestedScopes = [.email, .fullName]
                } onCompletion: { result in
                    Task {
                        await viewModel.handleSignInWithAppleResult(result)
                    }
                }
                .signInWithAppleButtonStyle(.black)
                .frame(width: 200, height: 45)
            }
        }
        .scaleEffect(isAnimating ? 1 : 0.5)
        .opacity(isAnimating ? 1 : 0)
        .onAppear {
            withAnimation(.spring(response: 0.8, dampingFraction: 0.6)) {
                isAnimating = true
            }
        }
    }
}

struct LoginBigDeviceComponent: View {
    
    @Binding var viewModel: UserViewModel
    @State private var isAnimating = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.principal)
                .ignoresSafeArea()
            
            Rectangle()
                .foregroundStyle(.white)
                .frame(width: 3000, height: 25)
                .padding(.bottom, 600)
            
            Rectangle()
                .foregroundStyle(.white)
                .frame(width: 25, height: 3000)
                .padding(.trailing, 600)
            
            VStack {
                Text("WELCOME!")
                    .font(.system(size: 30, weight: .bold))
                    .padding(.bottom, 70)
                
                SignInWithAppleButton(.signIn) { request in
                    request.requestedScopes = [.email, .fullName]
                } onCompletion: { result in
                    Task {
                        await viewModel.handleSignInWithAppleResult(result)
                    }
                }
                .signInWithAppleButtonStyle(.black)
                .frame(width: 200, height: 45)
            }
        }
        .scaleEffect(isAnimating ? 1 : 0.5)
        .opacity(isAnimating ? 1 : 0)
        .onAppear {
            withAnimation(.spring(response: 0.8, dampingFraction: 0.6)) {
                isAnimating = true
            }
        }
    }
}
