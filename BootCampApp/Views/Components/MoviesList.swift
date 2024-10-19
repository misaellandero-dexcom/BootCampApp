//
//  MovieList.swift
//  BootCampApp
//
//  Created by Francisco Landero on 18/10/24.
//

import SwiftUI

struct MoviesList: View {
    
    @Environment(MoviesModel.self) private var model
      
    
    var body: some View {
        List(model.movies) { movie in
            NavigationLink {
                MovieDetailView(movie: movie)
            } label: {
                MovieRow(movie: movie)
            }
        }
        .navigationTitle("Movies")
        .task {
            model.fetchMovies()
        }
    }
}

#Preview {
    NavigationStack {
        MoviesList()
            .environment(MoviesModel())
    }
}
