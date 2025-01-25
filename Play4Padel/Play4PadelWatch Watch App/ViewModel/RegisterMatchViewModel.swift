//
//  RegisterMatchViewModel.swift
//  Play4PadelWatch Watch App
//
//  Created by Carlos Gonzalez on 25/1/25.
//

import SwiftUI

@Observable
final class RegisterMatchViewModel {
    
    // MARK: - Properties
    
    var playerPoint: PointsType = .zero
    var rivalPoint: PointsType = .zero
    
    // MARK: - Functions
    
    // MARK: - Actions
    
    func currentPointsPlayer(_ points: PointsType, _ rival: PointsType) {
        if points.value == "0" {
            playerPoint = .fifteen
        } else if points.value == "15" {
            playerPoint = .thirty
        } else if points.value == "30" {
            playerPoint = .forty
        } else if points.value == rival.value {
            playerPoint = .advantage
        } else if rival.value == "ADV" {
            playerPoint = .forty
            rivalPoint = .forty
        } else {
            playerPoint = .zero
            rivalPoint = .zero
        }
    }
    
    func currentPointsRival(_ points: PointsType, _ rival: PointsType) {
        if points.value == "0" {
            rivalPoint = .fifteen
        } else if points.value == "15" {
            rivalPoint = .thirty
        } else if points.value == "30" {
            rivalPoint = .forty
        } else if points.value == rival.value {
            rivalPoint = .advantage
        } else if rival.value == "ADV" {
            playerPoint = .forty
            rivalPoint = .forty
        } else {
            rivalPoint = .zero
            playerPoint = .zero
        }
    }
}
