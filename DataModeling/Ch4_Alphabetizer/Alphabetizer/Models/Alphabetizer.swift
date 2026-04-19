//
//  Alphabetizer.swift
//  Alphabetizer
//
//  Created by kosoobin on 4/19/26.
//

import Foundation

@Observable
class Alphabetizer {
    private let tileCount = 3
    private var vocab: Vocabulary
    
    var tiles = [Tile]()
    var score = 0
    var message: Message = .instruction
    
    init(vocab: Vocabulary = .landAnimals) {
        self.vocab = vocab
        startNewGame()
    }
    
    /// 타일이 알파벳 순서대로 정렬되어 있는지 확인
    // /// : 문서화 주석
    func submit() async {
        let userSortedTiles = tiles.sorted {
            $0.position.x < $1.position.x
        }
        let alphabeticallySortedTiles = tiles.sorted {
            $0.word.lexicographicallyPrecedes($1.word)
        }
        
        // 타일이 알파벳 순서대로 배열되어 있는지 확인
        // TODO: 알파벳 순서와 위치를 비교
        let isAlphabetized = userSortedTiles == alphabeticallySortedTiles
        
        // 알파벳 순서대로 배열되어 있다면 점수를 1 더한다
        if isAlphabetized {
            score += 1
        }
        
        // 승리 또는 패배 메시지로 업데이트
        message = isAlphabetized ? .youWin : .tryAgain
        
        // 정답 타일을 뒤집는다
        for (tile, correctTile) in zip(userSortedTiles, alphabeticallySortedTiles) {
            let tileIsAlphabetized = tile == correctTile
            tile.flipped = tileIsAlphabetized
        }
        
        Task { @MainActor in
            // 2초간 대기
            try await Task.sleep(for: .seconds(2))
            
            // 알파벳 순서대로 배열되어 있다면 새로운 타일을 생성한다
            if isAlphabetized {
                
                startNewGame()
            }
            
            // 타일을 다시 뒤집어 단어를 표시한다
            for tile in tiles {
                tile.flipped = false
            }
            
            // 게임 방법을 표시한다
            message = .instruction
        }
        
    }
    
    // MARK: private implementaion
    
    /// tile를 알파벳 순서가 정렬되지 않은 새로운 단어 집합으로 업데이트
    private func startNewGame() {
        let newWords = vocab.selectRandomWords(count: tileCount)
        if tiles.isEmpty {
            for word in newWords {
                tiles.append(Tile(word: word))
            }
        } else {
            // 기존 타일에 새로운 단어를 할당
            for (tile, word) in zip(tiles, newWords) {
                tile.word = word
            }
        }
    }
}
