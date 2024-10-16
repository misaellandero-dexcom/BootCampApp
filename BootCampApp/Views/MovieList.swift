//
//  MovieList.swift
//  BootCampApp
//
//  Created by Francisco Landero on 16/10/24.
//

import SwiftUI

struct MovieList: View {
    @State private var viewModel = MoviesViewModel()
    @State var search = ""
    var body: some View {
        List{
            if viewModel.movies.isEmpty {
                ContentUnavailableView {
                    Label("No Movies yet", systemImage: "movieclapper.fill")
                } description: {
                    Text("Movies search results will appear here.")
                }
            } else {
                ForEach(viewModel.movies) { movie in
                    NavigationLink(destination: MovieView(movie: movie)) {
                        MovieCellView(movie: movie)
                    }
                }
            }
        }
        //.searchable(text: $search, prompt: "Movie Name")
        .navigationTitle("Movies Search")
        .toolbar(content: {
            ToolbarItem {
                HStack{
                    Image(systemName: "magnifyingglass")
                    TextField("Movie Name", text: $search)
                    #if os(watchOS)
                        .textFieldStyle(DefaultTextFieldStyle())
                    #else
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    #endif
                    Button("Search") {
                        //viewModel.movies = MovieModel.movieSamples
                        viewModel.searchMovies(byTitle: search)
                    }
                    .buttonStyle(BorderedProminentButtonStyle())
                }
            }
        })
    }
}

#Preview {
    MovieList()
}
