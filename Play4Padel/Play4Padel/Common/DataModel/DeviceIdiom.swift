//
//  DeviceIdiom.swift
//  Play4Padel
//
//  Created by Carlos Gonzalez on 12/1/25.
//

import SwiftUI

@MainActor
@propertyWrapper
struct DeviceIdiom {
    var wrappedValue: UIUserInterfaceIdiom {
        UIDevice.current.userInterfaceIdiom
    }
}
