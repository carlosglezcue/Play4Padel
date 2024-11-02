//
//  RegisterMatchView.swift
//  Play4Padel
//
//  Created by Carlos Gonzalez on 2/11/24.
//

import SwiftUI

struct RegisterMatchView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @Binding var textInfo: String
    @Binding var dateInfo: Date
    
    let saveAction: () -> ()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("• Add result:")
                .font(.body)
                .bold()
            
            ZStack {
                RoundedRectangle(cornerRadius: 10.0)
                    .stroke(Color.black, lineWidth: 1)
                    .background(Color.clear)
                    .frame(height: 300)
                
                VStack(alignment: .leading, spacing: 15) {
                    
                    RegisterSetsSection(
                        textToAdd: $textInfo,
                        title: "First Set:"
                    )
                    
                    RegisterSetsSection(
                        textToAdd: $textInfo,
                        title: "Second Set:"
                    )
                    
                    RegisterSetsSection(
                        textToAdd: $textInfo,
                        title: "Third Set:"
                    )
                    
                    HStack(alignment: .firstTextBaseline) {
                        Text("Position played:")
                        Spacer()
                        // TODO: Add Picker
                    }
                    
                    HStack(alignment: .firstTextBaseline) {
                        Text("Court Type:")
                        Spacer()
                        // TODO: Add Picker
                    }
                    
                    HStack(alignment: .firstTextBaseline) {
                        DatePicker(
                            "Date:",
                            selection: $dateInfo,
                            in: ...Date.now,
                            displayedComponents: .date
                        )
                    }
                }
                .padding(.horizontal)
            }
            
            HStack {
                NormalButton(
                    action: { saveAction() },
                    title: "Save",
                    width: 100,
                    style: PrincipalButton()
                )
                
                Spacer()
                
                NormalButton(
                    action: { dismiss() },
                    title: "Cancel",
                    width: 100,
                    style: CancelButton()
                )
            }
            .padding(.top)
            .padding(.horizontal, 20)
        }
        .padding()
        .presentationDetents([.medium])
    }
}

#Preview {
    RegisterMatchView(
        textInfo: .constant(""),
        dateInfo: .constant(.now),
        saveAction: { }
    )
}
