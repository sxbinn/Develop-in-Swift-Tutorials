//
//  StreakCalculator.swift
//  GratefulMoments
//
//  Created by kosoobin on 4/21/26.
//

import Foundation

struct StreakCalculator {
    let calendar = Calendar.current
    
    /// Counts the number of days in a row a moment has been saved
    ///
    /// Days are measured from the end of the day, rather than whatever time of day it is currently
    /// - precondition: `moments` must be sorted by timestamp, from earliest to latest
    func calculateStreak(for moments: [Moment]) -> Int {
        let startOfToday = calendar.startOfDay(for: .now)
        let endOfToday = calendar.date(byAdding: DateComponents(day: 1, second: -1), to: startOfToday)!
        
        let daysAgoArray = moments
            .reversed()
            .map(\.timestamp)
            .map { calendar.dateComponents([.day], from: $0, to:  endOfToday)}
            .compactMap { $0.day }
        print(daysAgoArray)
        
        var streak = 0
        for daysAgo in daysAgoArray {
            if daysAgo == streak {
                // 연속 기록이 이미 존재하므로, 연속 기록을 늘리지 않습니다.
                // 1일 동안 5개의 게시물은 1연속 기록입니다. 2일 동안 5개의 게시물은 2연속 기록입니다.
                continue
            } else if daysAgo == streak + 1 {
                // 현재 연속 기록의 다음 날에 게시물이 존재하므로, 연속 기록에 1을 더합니다.
                streak += 1
                print("streak를 \(streak)로 증가시켰습니다.")
            } else {
                // 하루 이상 건너뛰면 연속 기록이 끊어집니다.
                break
            }
        }
        
        // 연속 기록은 어제부터 위에서 계산됩니다. 오늘 아직 ‘모멘트’를 저장하지 않았더라도 연속 기록이 끊어지지는 않습니다.
        // 오늘 ‘모멘트’를 저장했다면, 이를 연속 기록에 포함시킵니다.
        if daysAgoArray.first == 0 {
            streak += 1
        }
        
        return streak
    }
}
