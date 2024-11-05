//
//  ReminderSubView.swift
//  Play4Padel
//
//  Created by Carlos Gonzalez on 4/11/24.
//

import SwiftUI

struct ReminderSubView: View {
    
    let hideReminder: () -> ()
    
    var body: some View {
        VStack {
            ZStack(alignment: .top) {
                RoundedRectangle(cornerRadius: 10.0)
                    .stroke(Color.black, lineWidth: 1)
                    .background(Color.clear)
                    .frame(height: 200)
                
                VStack(alignment: .leading) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8.0)
                            .foregroundStyle(.principal)
                            .frame(height: 75)
                            .padding([.top, .horizontal], 1)
                        
                        HStack {
                            Text("FRIENDLY REMINDER!")
                                .font(.title2)
                                .bold()
                            Spacer()
                            Button {
                                hideReminder()
                            } label: {
                                Image(systemName: "xmark.circle")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 30)
                            }
                            .buttonStyle(.plain)
                        }
                        .padding(.horizontal)
                    }
                    
                    Text("To record your matches in a more exhaustive way, remember to use the app on your Apple Watch")
                        .font(.callout)
                        .padding()
                }
            }
        }
    }
}
