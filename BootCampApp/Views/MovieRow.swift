//
//  MovieRow.swift
//  BootCampApp
//
//  Created by Francisco Landero on 18/10/24.
//

import SwiftUI

struct MovieRow: View {
    var movie: Movie
    var body: some View {
        
        HStack {
            AsyncImage(url: movie.imageURL) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
                
            } placeholder: {
                ProgressView()
            }
            .frame(height: 120)
            
            VStack(alignment: .leading) {
                Text(movie.title)
                    .bold()
                Label {
                    Text(movie.shortPopularityDescription)
                        .foregroundStyle(.secondary)
                } icon: {
                    Image(systemName: "star.fill")
                        .foregroundStyle(.yellow)
                }
                .font(.caption)
                
                HStack {
                    ForEach(movie.gendersArray.prefix(3), id: \.self) { gender in
                        Text(gender)
                            .lineLimit(1)
                            .truncationMode(.tail)
                            .font(.caption2)
                            .padding(.vertical, 1)
                            .padding(.horizontal, 3)
                            .background(.yellow.opacity(0.5))
                            .cornerRadius(10)
                    }
                }
                
                Label(movie.unwrappedReleaseDate.formatted(date: .abbreviated, time: .omitted), systemImage: "calendar")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            
        }
        
    }
    
}

#Preview {
    List{
        MovieRow(movie: Movie.sample)
        MovieRow(movie: Movie.sample)
        MovieRow(movie: Movie.sample)
    }
}
