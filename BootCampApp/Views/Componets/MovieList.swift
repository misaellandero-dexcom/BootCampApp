//
//  MovieList.swift
//  BootCampApp
//
//  Created by Francisco Landero on 18/10/24.
//

import SwiftUI

struct MovieList: View {
    @State var movies = [Movie.sample]
    var body: some View {
        List(movies){ movie in
            NavigationLink {
                MovieDetailView(movie: movie)
            } label: {
                MovieRow(movie: movie)
            }
        }
        .navigationTitle("Movies")
    }
}

#Preview {
    MovieList()
}
