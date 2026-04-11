//
//  Player.swift
//  06_ScoreKeeper
//
//  Created by kosoobin on 4/9/26.
//

import Foundation

struct Player: Identifiable {
    let id = UUID()
    
    var name: String
    var score: Int
}

extension Player: Equatable {
    // lhs: left-hand side
    // rhs: right-thand side
    // == 구현하면 Swift가 자동으로 != 도 제공
    static func == (lhs: Player, rhs: Player) -> Bool {
        lhs.name == rhs.name && lhs.score == rhs.score
    }
}
