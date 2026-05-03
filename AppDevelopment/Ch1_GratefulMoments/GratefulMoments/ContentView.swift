//
//  ContentView.swift
//  GratefulMoments
//
//  Created by kosoobin on 4/19/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Moments", image: "MomentsTab") {
                MomentsView()
            }
            Tab("Archievements", systemImage: "medal.fill") {
                AchievementsView()
            }
        }
    }
}

#Preview {
    ContentView()
        .sampleDataContainer()
}

#Preview("Dark") {
    ContentView()
        .sampleDataContainer()
        .preferredColorScheme(.dark)
}
