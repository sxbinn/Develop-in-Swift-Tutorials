//
//  _6_ScoreKeeperTests.swift
//  06_ScoreKeeperTests
//
//  Created by kosoobin on 4/11/26.
//

import Testing
@testable import _6_ScoreKeeper

struct _6_ScoreKeeperTests {

    @Test("Reset player scores", arguments: [0, 10, 20])
    func resetScores(to newValue: Int) async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
        // Swift Testing Documentation
        // https://developer.apple.com/documentation/testing
        
        var scoreboard = Scoreboard(players: [
            Player(name: "Bucky", score: 0),
            Player(name: "Steve", score: 5),
        ])
        scoreboard.resetScores(to: newValue)
        
        for player in scoreboard.players {
            // #expect 테스트가 false인지 아닌지 검증
            #expect(player.score == newValue)
        }
    }
    
    @Test("Highest score wins")
    func highestScoreWin() {
        let scoreboard = Scoreboard(players: [
            Player(name: "Bucky", score: 0),
            Player(name: "Steve", score: 5),
        ],
        state: .gameOver,
        doesHighestScoreWin: true
        )
        
        let winners = scoreboard.winners
        #expect(winners == [Player(name: "Steve", score: 5)])
    }
    
    @Test("Lowest score wins")
    func lowestScoreWin() {
        let scoreboard = Scoreboard(players: [
            Player(name: "Bucky", score: 0),
            Player(name: "Steve", score: 5),
        ],
        state: .gameOver,
        doesHighestScoreWin: false
        )
        
        let winners = scoreboard.winners
        #expect(winners == [Player(name: "Bucky", score: 0)])
    }

}
