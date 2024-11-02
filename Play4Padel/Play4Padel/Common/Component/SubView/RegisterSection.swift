//
//  RegisterSection.swift
//  Play4Padel
//
//  Created by Carlos Gonzalez on 2/11/24.
//

import SwiftUI

struct RegisterSetsSection: View {
    
    @Binding var textToAdd: String
    let title: String
    
    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            Text(title)
                .underline()
                .font(.body)
                .foregroundStyle(.primary)
            
            Spacer()
            TextField("", text: $textToAdd)
                .font(.callout)
                .textFieldStyle(.roundedBorder)
                .frame(width: 50)
                .keyboardType(.numberPad)
            Text("-")
            TextField("", text: $textToAdd)
                .font(.callout)
                .textFieldStyle(.roundedBorder)
                .frame(width: 50)
                .keyboardType(.numberPad)
        }
    }
}

#Preview {
    RegisterSetsSection(
        textToAdd: .constant(""),
        title: "First Set:"
    )
}
