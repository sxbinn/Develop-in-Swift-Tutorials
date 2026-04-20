//
//  BadgeDetails.swift
//  GratefulMoments
//
//  Created by kosoobin on 4/21/26.
//

import Foundation
import SwiftUI

// Codable
// : 나중에 모델을 저장할 수 있도록

// Caselterable
// : 나머지 코드에서 모든 케이스에 접근할 수 있도록
enum BadgeDetails: Int, Codable, CaseIterable {
    case firstEntry
    case fiveStars
    case shutterbug
    case expressive
    case perfectTen
    
    var requirements: String {
        switch self {
        case .firstEntry:
            return "여정을 시작하려면 순간을 기록하세요."
        case .fiveStars:
            return "5개의 순간을 기록하세요"
        case .shutterbug:
            return "사진이 포함된 게시물을 3개 추가하세요."
        case .expressive:
            return "사진과 텍스트가 포함된 순간을 5개 추가하세요."
        case .perfectTen:
            return "최소 10개의 순간을 기록하고, 그 과정에서 다른 모든 배지를 모두 수집하세요."
        }
    }
    
    var color: Color {
        switch self {
        case .firstEntry:
            return .ember
        case .fiveStars:
            return .ruby
        case .shutterbug:
            return .sapphire
        case .expressive:
            return .ocean
        case .perfectTen:
            return .ember
        }
    }
    
    var congratulatoryMessage: String {
        switch self {
        case .firstEntry:
            return "모든 여정은 한 걸음부터 시작됩니다. 축하해요 — 이제 시작이에요!"
        case .fiveStars:
            return "좋은 흐름을 타고 있어요! 꾸준히 연습할수록, 의도한 습관을 계속 이어가는 능력이 더 좋아질 거예요."
        case .shutterbug:
            return "사진은 우리를 과거와 이어주고, 그 순간의 감사한 감정을 다시 떠올리게 해줘요."
        case .expressive:
            return "와, 행복한 기억을 충분히 음미할 수 있는 다양한 방법을 잘 활용하고 있네요!"
        case .perfectTen:
            return "새로운 습관에 점점 익숙해지고 있어요! 계속 이어가면서 어디까지 갈 수 있는지 지켜봐요."
        }
    }
    
    var title: String {
        switch self {
        case .firstEntry:
            return "여정의 시작"
        case .fiveStars:
            return "별 5개"
        case .shutterbug:
            return "사진 애호가"
        case .expressive:
            return "표현력 풍부"
        case .perfectTen:
            return "완벽한 10"
        }
    }
    
    var image: ImageResource {
        switch self {
        case .firstEntry:
            return .firstEntryUnlocked
        case .fiveStars:
            return .fiveStarsUnlocked
        case .shutterbug:
            return .shutterbugUnlocked
        case .expressive:
            return .expressiveUnlocked
        case .perfectTen:
            return .perfectTenUnlocked
        }
    }
    
    
    var lockedImage: ImageResource {
        switch self {
        case .firstEntry:
            return .firstEntryLocked
        case .fiveStars:
            return .fiveStarsLocked
        case .shutterbug:
            return .shutterbugLocked
        case .expressive:
            return .expressiveLocked
        case .perfectTen:
            return .perfectTenLocked
        }
    }
}
