//
//  RegisterMatchView.swift
//  Play4Padel
//
//  Created by Carlos Gonzalez on 2/11/24.
//

import SwiftUI

struct RegisterMatchView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @DeviceIdiom private var deviceIdiom
    
    @Binding var userFirstSet: Int
    @Binding var userSecondSet: Int
    @Binding var userThirdSet: Int
    @Binding var rivalFirstSet: Int
    @Binding var rivalSecondSet: Int
    @Binding var rivalThirdSet: Int
    @Binding var dateInfo: Date
    @Binding var courtTypeSelected: TypeCourt
    @Binding var positionSelected: PlayerPositionType
    
    let saveAction: () -> ()
    
    var body: some View {
        VStack(alignment: .leading) {
            HeaderView(
                section: "Add result:",
                subsection: ""
            )
            
            Spacer()
            
            ZStack {
                RoundedRectangle(cornerRadius: 10.0)
                    .stroke(.darkBlack, lineWidth: 1)
                    .fill(.boxDark)
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
                            ForEach([PlayerPositionType.backhand, PlayerPositionType.drive, PlayerPositionType.both], id: \.self) { position in
                                Button(position.rawValue) {
                                    positionSelected = position
                                }
                            }
                        } label: {
                            Text(positionSelected == .none ? "Select position" : positionSelected.toView())
                                .foregroundStyle(positionSelected == .none ? .gray : .primary)
                        }
                    }
                    
                    HStack(alignment: .firstTextBaseline) {
                        Text("Court Type:")
                        Spacer()
                        Menu {
                            ForEach([TypeCourt.indoor, TypeCourt.outdoor], id: \.self) { type in
                                Button(type.rawValue) {
                                    courtTypeSelected = type
                                }
                            }
                        } label: {
                            Text(courtTypeSelected == .none ? "Select court" : courtTypeSelected.toView())
                                .foregroundStyle(courtTypeSelected == .none ? .gray : .primary)
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
            .padding()
            .padding(.horizontal, deviceIdiom == .pad ? 200 : 0)
            
            HStack {
                NormalButton(
                    buttonAction: {
                        saveAction()
                    },
                    title: "Save",
                    width: 100,
                    style: PrincipalButton()
                )
                
                Spacer()
                
                NormalButton(
                    buttonAction: { dismiss() },
                    title: "Cancel",
                    width: 100,
                    style: CancelButton()
                )
            }
            .padding(.bottom, 40)
            .padding(.horizontal, deviceIdiom == .pad ? 350 : 40)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.boxDark)
    }
}

#Preview {
    RegisterMatchView(
        userFirstSet: .constant(.zero),
        userSecondSet: .constant(.zero),
        userThirdSet: .constant(.zero),
        rivalFirstSet: .constant(.zero),
        rivalSecondSet: .constant(.zero),
        rivalThirdSet: .constant(.zero),
        dateInfo: .constant(.now),
        courtTypeSelected: .constant(.none),
        positionSelected: .constant(.none),
        saveAction: { }
    )
}
