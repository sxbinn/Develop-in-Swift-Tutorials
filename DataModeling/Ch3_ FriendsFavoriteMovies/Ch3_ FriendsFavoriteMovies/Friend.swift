//
//  Friend.swift
//  Ch3_ FriendsFavoriteMovies
//
//  Created by kosoobin on 4/12/26.
//

import Foundation
import SwiftData

@Model
class Friend {
    var name: String
    var favoriteMovie: Movie?
    
    init(name: String) {
        // 내 이름 = 너가 준 이름
        self.name = name
    }
    
    static let sampleData = [
        Friend(name: "Niya"),
        Friend(name: "Jenna"),
        Friend(name: "Dani"),
        Friend(name: "River"),
        Friend(name: "Mokryun"),
        Friend(name: "Chris"),
        Friend(name: "Craig"),
    ]
}
