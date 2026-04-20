//
//  Badge.swift
//  GratefulMoments
//
//  Created by kosoobin on 4/21/26.
//

import Foundation
import SwiftData

/// 배지가 해금되었는지 판단할 때 `timestamp`를 사용합니다.
/// `Moment`는 삭제될 수 있지만, timestamp는 유지됩니다.
/// 한 번 획득한 배지는 다시 잠기지 않습니다.
@Model
class Badge {
    var details: BadgeDetails
    var moment: Moment?
    var timestamp: Date?
    
    init(details: BadgeDetails) {
        self.details = details
        self.moment = nil
        self.timestamp = nil
    }
}

extension Badge {
    static var sample: Badge {
        let badge = Badge(details: .firstEntry)
        badge.timestamp = .now
        return badge
    }
}
