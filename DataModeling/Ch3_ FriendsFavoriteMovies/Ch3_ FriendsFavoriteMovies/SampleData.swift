//
//  SampleData.swift
//  Ch3_ FriendsFavoriteMovies
//
//  Created by kosoobin on 4/12/26.
//

import Foundation
import SwiftData

@MainActor
class SampleData {
    // static : 클래스 자체에 속하도록 정의
    // '타입' 프로퍼티 혹은 '타입' 함수
    // 오버라이딩 불가능
    static let shared = SampleData()
    
    let modelContainer: ModelContainer
    
    var context: ModelContext {
        modelContainer.mainContext
    }
    
    var friend: Friend {
        Friend.sampleData.first!
    }
    
    var movie: Movie {
        Movie.sampleData.first!
    }
    
    private init () {
        // 샘플 데이터 세팅의 복잡함을 숨기기 위해서
        // 밖에서 받지 않고 안에서 만듦
        // 스키마: 이 데이터를 어떻게 저장하고 읽을지 정의하는 규칙
        // 코드에서 정의한 클래스를 데이터 저장소의 데이터와 연결
        let schema = Schema([
            Friend.self,
            Movie.self,
        ])
        
        // 스키마를 전달하고 데이터를 영구 저장하지 않고 메모리에 저장하도록 하는 변수
        // 프리뷰에는 영구 저장 데이터 X, 프리뷰가 새로고침될 때마다 깨끗한 샘플 데이터 설정하는게 굿
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)
        
        do {
            modelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])
            
            insertSampleData()
            
            try context.save()
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }
    
    private func insertSampleData() {
        for friend in Friend.sampleData {
            context.insert(friend)
        }
        
        for movie in Movie.sampleData {
            context.insert(movie)
        }
        
        Friend.sampleData[0].favoriteMovie = Movie.sampleData[1]
        Friend.sampleData[2].favoriteMovie = Movie.sampleData[0]
        Friend.sampleData[3].favoriteMovie = Movie.sampleData[4]
        Friend.sampleData[4].favoriteMovie = Movie.sampleData[0]
    }
}
