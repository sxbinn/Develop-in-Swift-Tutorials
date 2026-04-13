//
//  Movie.swift
//  Ch3_ FriendsFavoriteMovies
//
//  Created by kosoobin on 4/12/26.
//

import Foundation
import SwiftData

@Model
class Movie {
    var title: String
    var releaseDate: Date
    var favoritedBy = [Friend]()
    
    init(title: String, releaseDate: Date) {
        self.title = title
        self.releaseDate = releaseDate
    }
    
    static let sampleData = [
        Movie(title: "Tenet", releaseDate: Date(timeIntervalSinceReferenceDate: -402_000_000)),
        Movie(title: "Amazing Spider-Man",
                      releaseDate: Date(timeIntervalSinceReferenceDate: -20_000_000)),
        Movie(title: "Project Hail Mary",
                      releaseDate: Date(timeIntervalSinceReferenceDate: 300_000_000)),
        Movie(title: "Eternal Sunshine",
                      releaseDate: Date(timeIntervalSinceReferenceDate: 120_000_000)),
        Movie(title: "Your Name",
                      releaseDate: Date(timeIntervalSinceReferenceDate: 550_000_000)),
        Movie(title: "Inception",
                      releaseDate: Date(timeIntervalSinceReferenceDate: -1_700_000_000)),
    ]
}

