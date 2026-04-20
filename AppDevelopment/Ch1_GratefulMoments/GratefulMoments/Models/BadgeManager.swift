//
//  BadgeManager.swift
//  GratefulMoments
//
//  Created by kosoobin on 4/21/26.
//

import Foundation
import SwiftData

class BadgeManager {
    private var modelContainer: ModelContainer
    
    init(modelContainer: ModelContainer) {
        self.modelContainer = modelContainer
    }
    
    func unlockBadges(newMoment: Moment) throws {
        // 저장된 모든 항목을 가져옴
        let context = modelContainer.mainContext
        let moments = try context.fetch(FetchDescriptor<Moment>())
        
        // 타임스탬프가 없는 뱃지를 필터링 -> 현재 잠겨있는 뱃지를 가져옴
        let lockedBadges = try context.fetch(FetchDescriptor<Badge>(predicate: #Predicate { $0.timestamp == nil }))
        
        var newlyUnlocked: [Badge] = []
        for badge in lockedBadges {
            switch badge.details {
            case .firstEntry where moments.count >= 1,
                    .fiveStars where moments.count >= 5,
                    .shutterbug where moments.count(where: { $0.image != nil }) >= 3,
                    .expressive where moments.count(where: { $0.image != nil && !$0.note.isEmpty }) >= 5,
                    .perfectTen where moments.count >= 10 && lockedBadges.count == 1:
                newlyUnlocked.append(badge)
            default:
                continue
            }
        }
        
        for badge in newlyUnlocked {
            badge.moment = newMoment
            badge.timestamp = newMoment.timestamp
        }
    }
    
    // throws: 함수가 에러를 던질 수 있다
    func loadBadgeIfNeeded() throws {
        let context = modelContainer.mainContext
        
        // 데이터를 어떻게 가져올건지
        // 가져올 데이터의 유형을 정의 가능, 결과 필터링, 정렬 및 결과 수 제한도 가능
        var fetchDescriptor = FetchDescriptor<Badge>()
        
        // 데이터가 존재하는지만 확인할 때 => 이미 뱃지가 1개라도 있으면 ㅇㅋ
        fetchDescriptor.fetchLimit = 1
        let existingBadges = try context.fetch(fetchDescriptor)
        if existingBadges.isEmpty {
            for details in BadgeDetails.allCases {
                context.insert(Badge(details: details))
            }
        }
    }
}
