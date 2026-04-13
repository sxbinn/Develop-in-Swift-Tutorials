//
//  FilteredMovieList.swift
//  Ch3_ FriendsFavoriteMovies
//
//  Created by kosoobin on 4/14/26.
//

import SwiftUI
import SwiftData

struct FilteredMovieList: View {
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            MovieList(titleFilter: searchText)
                .searchable(text: $searchText)
        }
//        detail: {
//            Text("Select a movie")
//                .navigationTitle("Movie")
//                .navigationBarTitleDisplayMode(.inline)
//        }
    }
}

#Preview {
    FilteredMovieList()
        .modelContainer(SampleData.shared.modelContainer)
}
