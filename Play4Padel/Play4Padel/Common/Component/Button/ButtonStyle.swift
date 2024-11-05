//
//  ButtonStyle.swift
//  Play4Padel
//
//  Created by Carlos Gonzalez on 2/11/24.
//

import SwiftUI

protocol ButtonStyle {
    var fontType: Font { get }
    var foregroundColor: Color { get }
    var textColor: Color { get }
    var heightButton: CGFloat { get }
}

struct PrincipalButton: ButtonStyle {
    var fontType: Font { .body }
    var foregroundColor: Color { .principal }
    var textColor: Color { .black }
    var heightButton: CGFloat { 30 }
}

struct PrincipalLargeButton: ButtonStyle {
    var fontType: Font { .title2 }
    var foregroundColor: Color { .principal }
    var textColor: Color { .black }
    var heightButton: CGFloat { 70 }
}

struct CancelButton: ButtonStyle {
    var fontType: Font { .body }
    var foregroundColor: Color { .darkBlack }
    var textColor: Color { .principalText }
    var heightButton: CGFloat { 30 }
}

struct DeleteButton: ButtonStyle {
    var fontType: Font { .body }
    var foregroundColor: Color { .red }
    var textColor: Color { .red}
    var heightButton: CGFloat { 30 }
}
