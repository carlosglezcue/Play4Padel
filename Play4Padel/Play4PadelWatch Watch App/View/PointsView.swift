//
//  PointsView.swift
//  PersonalProjectWatch Watch App
//
//  Created by Carlos Gonzalez on 12/10/24.
//

import SwiftUI

enum PointsType {
    case fifteen
    case thirty
    case forty
    case advantage
    case zero
}

extension PointsType {
    var value: String {
        return switch self {
            case .fifteen: "15"
            case .thirty: "30"
            case .forty: "40"
            case .advantage: "ADV"
            case .zero: "0"
        }
    }
}

struct PointsView: View {
    
    @State var playerOnePoint: PointsType = .zero
    @State var palyerTwoPoint: PointsType = .zero
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 10.0)
                        .fill(.principal.opacity(0.25))
                        .frame(width: 60, height: 160)
                    
                    VStack {
                        Text("Players")
                            .font(.caption)
                        
                        Spacer()
                        
                        Text(playerOnePoint.value)
                            .font(.title)
                        
                        Spacer()
                        
                        Button {
                            currentPointsPlayerOne(playerOnePoint, rival: palyerTwoPoint)
                        } label: {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 40)
                                .foregroundStyle(.principal)
                        }
                        .buttonStyle(.plain)
                    }
                    .padding(.vertical)
                }
                
                VStack {
                    Text("-")
                        .font(.title)
                        .padding(.bottom, 20)
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 10.0)
                        .fill(.blue.opacity(0.25))
                        .frame(width: 60, height: 160)
                    
                    VStack {
                        Text("Rivals")
                            .font(.caption)
                        
                        Spacer()
                        
                        Text(palyerTwoPoint.value)
                            .font(.title)
                        
                        Spacer()
                        
                        Button {
                            currentPointsPlayerTwo(palyerTwoPoint, rival: playerOnePoint)
                        } label: {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 40)
                                .foregroundStyle(.blue)
                        }
                        .buttonStyle(.plain)
                    }
                    .padding(.vertical)
                }
            }
            Spacer()
        }
        .padding(.horizontal)
    }
    
    func currentPointsPlayerOne(_ points: PointsType, rival: PointsType) {
        if points.value == "0" {
            playerOnePoint = .fifteen
        } else if points.value == "15" {
            playerOnePoint = .thirty
        } else if points.value == "30" {
            playerOnePoint = .forty
        } else if points.value == rival.value {
            playerOnePoint = .advantage
        } else if rival.value == "ADV" {
            playerOnePoint = .forty
            palyerTwoPoint = .forty
        } else {
            playerOnePoint = .zero
            palyerTwoPoint = .zero
        }
    }
    
    func currentPointsPlayerTwo(_ points: PointsType, rival: PointsType) {
        if points.value == "0" {
            palyerTwoPoint = .fifteen
        } else if points.value == "15" {
            palyerTwoPoint = .thirty
        } else if points.value == "30" {
            palyerTwoPoint = .forty
        } else if points.value == rival.value {
            palyerTwoPoint = .advantage
        } else if rival.value == "ADV" {
            playerOnePoint = .forty
            palyerTwoPoint = .forty
        } else {
            palyerTwoPoint = .zero
            playerOnePoint = .zero
        }
    }
}

#Preview {
    PointsView()
}
