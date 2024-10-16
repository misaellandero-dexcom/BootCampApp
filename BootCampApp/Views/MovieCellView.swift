//
//  MovieCellView.swift
//  BootCampApp
//
//  Created by Francisco Landero on 16/10/24.
//

import SwiftUI

struct MovieCellView: View {
    let movie : MovieModel
    var body: some View {
        HStack{ 
            AsyncImage(
                url: movie.imageURL,
                content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(10)
                        .frame(maxWidth: 50, maxHeight: 100)
                        .padding()
                },
                placeholder: {
                    ProgressView()
                }
            )
            
            VStack{
                Text(movie.titleText?.text ?? "")
                #if os(watchOS)
                    .font(.body)
                #else
                    .font(.title)
                #endif
                    .bold()
                +
                Text(" \n")
                Text(movie.unwrappedYear,format: .number.grouping(.never))
                    .font(.caption)
                    .bold()
                    .foregroundStyle(.secondary)
            }
            
            
        }
    }
}

#Preview {
    MovieCellView(movie:MovieModel.movieSample1)
}
