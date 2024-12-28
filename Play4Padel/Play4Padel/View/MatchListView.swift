//
//  MatchListView.swift
//  Play4Padel
//
//  Created by Carlos Gonzalez on 2/11/24.
//

import SwiftUI
import SwiftData

struct MatchListView: View {
    
    @Query var dataMatch: [MatchData]
    @State private var viewModel = MatchViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                HeaderView(
                    section: "Matches",
                    subsection: ""
                )
                
                HStack(alignment: .lastTextBaseline) {
                    Text("Ordered by:")
                        .font(.callout)
                        .padding()
                    
                    Picker("Select a section", selection: $viewModel.selectedSection) {
                        ForEach(MatchSection.allCases) { section in
                            Text(section.rawValue).tag(section)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal)
                }
                
                ScrollView {
                    VStack(alignment: .leading) {
                        if dataMatch.isEmpty {
                            NoMatchesView(title: "You don't have any match saved yet")
                                .padding()
                        } else {
                            ForEach(viewModel.getDataList(dataMatch), id: \.id) { match in
                                NavigationLink(value: match) {
                                    MatchCellView(
                                        result: .constant(Utils.getResultMatch(match)),
                                        activity: .constant("\(Utils.getTotalCalories(match)) cal | \(Utils.getTotalMatchDuration(match)) mins"),
                                        date: .constant((match.date ?? .now).formatted(date: .numeric, time: .omitted))
                                    )
                                    .padding()
                                }
                                .buttonStyle(.plain)
                            }
                        }
                    }
                }
                .scrollBounceBehavior(.basedOnSize)
            }
            .navigationDestination(for: MatchData.self) { match in
                MatchDetailView(viewModel: MatchDetailViewModel(match: match))
            }
        }
    }
}

#Preview(traits: .sampleData) {
    MatchListView()
}
