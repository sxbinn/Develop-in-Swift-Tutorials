//
//  MovieList.swift
//  Ch3_ FriendsFavoriteMovies
//
//  Created by kosoobin on 4/12/26.
//

import SwiftUI
import SwiftData

struct MovieList: View {
    @Query private var movies: [Movie]
    @Environment(\.modelContext) private var context
    @State private var newMovie: Movie?
    
    init(titleFilter: String = "") {
        let predicate = #Predicate<Movie> { movie in
            titleFilter.isEmpty || movie.title.localizedStandardContains(titleFilter)
        }
        
        _movies = Query(filter: predicate, sort: \Movie.title)
    }
    
    var body: some View {
//        NavigationSplitView {
            Group {
                if !movies.isEmpty {
                    List {
                        ForEach(movies) { movie in
                            NavigationLink(movie.title) {
                                MovieDetail(movie: movie)
                            }
                        }
                        .onDelete(perform: deleteMovies(indexes:))
                    }
                } else {
                    ContentUnavailableView("Add Movies", systemImage: "film.stack")
                }
            }
            .navigationTitle("Movies")
            .toolbar {
                ToolbarItem {
                    Button("Add movie", systemImage: "plus", action: addMovie)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    EditButton()
                }
            }
            .sheet(item: $newMovie) { movie in
                NavigationStack {
                    MovieDetail(movie: movie, isNew: true)
                }
                .interactiveDismissDisabled()
            }
//        } detail: {
//            Text("Select a movie")
//                .navigationTitle("Movie")
//                .navigationBarTitleDisplayMode(.inline)
//        }
    }
    
    private func addMovie() {
        let newMovie = Movie(title: "", releaseDate: .now)
        context.insert(newMovie)
        self.newMovie = newMovie
    }
    
    private func deleteMovies(indexes: IndexSet) {
        for index in indexes {
            context.delete(movies[index])
        }
    }
}

#Preview {
    NavigationStack {
        MovieList()
            .modelContainer(SampleData.shared.modelContainer)
    }
}

#Preview("Filtered") {
    NavigationStack {
        MovieList(titleFilter: "ne")
            .modelContainer(SampleData.shared.modelContainer)
    }
}

#Preview("Empty List") {
    NavigationStack {
        MovieList(titleFilter: "ne")
            .modelContainer(for: Movie.self, inMemory: true)
    }
}
