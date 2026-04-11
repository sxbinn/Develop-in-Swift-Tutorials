//
//  SettingsView.swift
//  06_ScoreKeeper
//
//  Created by kosoobin on 4/11/26.
//

import SwiftUI

struct SettingsView: View {
    @Binding var doesHighestScoreWin: Bool
    @Binding var startingPoints: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Game Rules")
                .font(.headline)
            Divider()
            Picker("Win codition", selection: $doesHighestScoreWin) {
                Text("Highest score wins")
                    .tag(true)
                Text("Lowest score wins")
                    .tag(false)
            }
            Picker("Starting Points", selection: $startingPoints) {
                Text("0 starting points")
                    .tag(0)
                Text("10 starting points")
                    .tag(10)
                Text("20 starting points")
                    .tag(20)
            }
        }
        .padding()
        .background(.thinMaterial, in: .rect(cornerRadius: 10.0))
    }
}

#Preview {
    @Previewable @State var doesHighestScoreWin = true
    @Previewable @State var startingPoints: Int = 10
    SettingsView(doesHighestScoreWin: $doesHighestScoreWin,startingPoints: $startingPoints)
}
