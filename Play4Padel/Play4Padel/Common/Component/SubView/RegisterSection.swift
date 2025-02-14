//
//  RegisterSection.swift
//  Play4Padel
//
//  Created by Carlos Gonzalez on 2/11/24.
//

import SwiftUI

struct RegisterSetsSection: View {
    
    @Binding var userSet: Int
    @Binding var rivalSet: Int
    let title: LocalizedStringKey
    
    @FocusState private var isFocused: Bool
    
    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            Text(title)
                .font(.body)
                .foregroundStyle(.primary)
            
            Spacer()
            TextField("", value: $userSet, format: .number)
                .font(.callout)
                .foregroundStyle(.gray)
                .textFieldStyle(.roundedBorder)
                .frame(width: 50)
                .keyboardType(.numberPad)
            Text("-")
            TextField("", value: $rivalSet, format: .number)
                .font(.callout)
                .foregroundStyle(.gray)
                .textFieldStyle(.roundedBorder)
                .frame(width: 50)
                .keyboardType(.numberPad)
        }
    }
}

#Preview {
    RegisterSetsSection(
        userSet: .constant(.zero),
        rivalSet: .constant(.zero),
        title: "First Set:"
    )
}
