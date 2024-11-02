//
//  HomeViewModel.swift
//  Play4Padel
//
//  Created by Carlos Gonzalez on 2/11/24.
//

import SwiftUI

@Observable
final class HomeViewModel {
    
    // MARK: - Properties
    
    var isRegister: Bool = false
    var firstSetData: String = ""
    var secondSetData: String = ""
    let thirdSetData: String = ""
    let courtTypeData: String = ""
    let matchTimeData: String = ""
    let dateMatchData: Date = .now
    let isVisible: Bool = true
    
    
    
    // MARK: - Actions
    
    func registerMatchAction() {
        isRegister.toggle()
    }
}
