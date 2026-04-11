//
//  Scoreboard.swift
//  06_ScoreKeeper
//
//  Created by kosoobin on 4/9/26.
//

import Foundation

struct Scoreboard {
    var players: [Player] = [
        Player(name: "Beenzino", score: 0),
        Player(name: "Changmo", score: 0),
        Player(name: "Esens", score: 0)
    ]
    
    var state = GameState.setup
    var doesHighestScoreWin = true
    
    var winners: [Player] {
        // guard: 조건이 참인지 확인하고, 참이 아니면 함수를 조기에 종료
        guard state == .gameOver else { return [] }
        
        var winningScore = 0
        if doesHighestScoreWin {
            winningScore = Int.min
            for player in players {
                winningScore = max(player.score, winningScore)
            }
        } else {
            winningScore = Int.max
            for player in players {
                winningScore = min(player.score, winningScore)
            }
        }
        
        return players.filter{ player in
            player.score == winningScore
        }
    }
    
    // mutating: value type 내부 값을 수정 가능하게 해줌
    mutating func resetScores(to newValue: Int) {
        for index in 0..<players.count {
            players[index].score = newValue
        }
    }
}
