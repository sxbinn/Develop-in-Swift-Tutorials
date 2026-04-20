//
//  DataContainer.swift
//  GratefulMoments
//
//  Created by kosoobin on 4/20/26.
//

import SwiftData
import SwiftUI

@Observable
@MainActor
class DataContainer {
    let modelContainer: ModelContainer
    let badgeManager: BadgeManager
    
    var context: ModelContext {
        modelContainer.mainContext
    }
    
    init(includeSampleMoments: Bool = false) {
        let schema = Schema([
            Moment.self,
            Badge.self,
        ])
        
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: includeSampleMoments)
        
        do {
            modelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])
            
            // ModelContainer랑 같이 묶어서 DataContainer에서 관리하자
            // 의존성 주입
            badgeManager = BadgeManager(modelContainer: modelContainer)
            
            // DataContainer가 생성될 때마다 모든 뱃지 불러옴
            // 중복 로딩 방지
            try badgeManager.loadBadgeIfNeeded()
            
            if includeSampleMoments {
                try loadSampleMoments()
            }
            try context.save()
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }
    
    private func loadSampleMoments() throws {
        for moment in Moment.sampleData {
            context.insert(moment)
            try badgeManager.unlockBadges(newMoment: moment)
        }
    }
}

private let sampleContainer = DataContainer(includeSampleMoments: true)

extension View {
    func sampleDataContainer() -> some View {
        self
            .environment(sampleContainer)
            .modelContainer(sampleContainer.modelContainer)
    }
}
