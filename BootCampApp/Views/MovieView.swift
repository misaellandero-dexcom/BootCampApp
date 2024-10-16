//
//  MovieView.swift
//  BootCampApp
//
//  Created by Francisco Landero on 16/10/24.
//

import SwiftUI

struct MovieView: View {
    let movie: MovieModel
    var body: some View {
        VStack{
            AsyncImage(
                url: movie.imageURL,
                content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                },
                placeholder: {
                    ProgressView()
                }
            )
        }
        .navigationTitle(movie.titleText?.text ?? "")
    }
}

#Preview {
    MovieView(movie: MovieModel.movieSample1)
}
