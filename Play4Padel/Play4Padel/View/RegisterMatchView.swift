//
//  RegisterMatchView.swift
//  Play4Padel
//
//  Created by Carlos Gonzalez on 2/11/24.
//

import SwiftUI

struct RegisterMatchView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @Binding var userFirstSet: String
    @Binding var userSecondSet: String
    @Binding var userThirdSet: String
    @Binding var rivalFirstSet: String
    @Binding var rivalSecondSet: String
    @Binding var rivalThirdSet: String
    @Binding var dateInfo: Date
    @Binding var courtTypeSelected: CourtType
    @Binding var positionSelected: PositionType
    
    let saveAction: () -> ()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("• Add result")
                .font(.title2)
                .bold()
            
            ZStack {
                RoundedRectangle(cornerRadius: 10.0)
                    .stroke(.darkBlack, lineWidth: 1)
                    .background(.boxDark)
                    .frame(height: 300)
                
                VStack(alignment: .leading, spacing: 15) {
                    
                    RegisterSetsSection(
                        userSet: $userFirstSet,
                        rivalSet: $rivalFirstSet,
                        title: "First Set:"
                    )
                    
                    RegisterSetsSection(
                        userSet: $userSecondSet,
                        rivalSet: $rivalSecondSet,
                        title: "Second Set:"
                    )
                    
                    RegisterSetsSection(
                        userSet: $userThirdSet,
                        rivalSet: $rivalThirdSet,
                        title: "Third Set:"
                    )
                    
                    HStack(alignment: .firstTextBaseline) {
                        Text("Position played:")
                        Spacer()
                        Menu {
                            ForEach([CourtType.indoor, CourtType.outdoor], id: \.self) { type in
                                Button(type.rawValue) {
                                    courtTypeSelected = type
                                }
                            }
                        } label: {
                            Text("Select court type")
                                .foregroundStyle(.gray)
                        }
                    }
                    
                    HStack(alignment: .firstTextBaseline) {
                        Text("Court Type:")
                        Spacer()
                        Menu {
                            ForEach([PositionType.backhand, PositionType.drive], id: \.self) { position in
                                Button(position.rawValue) {
                                    positionSelected = position
                                }
                            }
                        } label: {
                            Text("Select position")
                                .foregroundStyle(.gray)
                        }
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
        userFirstSet: .constant(""),
        userSecondSet: .constant(""),
        userThirdSet: .constant(""),
        rivalFirstSet: .constant(""),
        rivalSecondSet: .constant(""),
        rivalThirdSet: .constant(""),
        dateInfo: .constant(.now),
        courtTypeSelected: .constant(.indoor),
        positionSelected: .constant(.backhand),
        saveAction: { }
    )
}
