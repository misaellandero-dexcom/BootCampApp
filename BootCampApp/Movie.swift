//
//  Movie.swift
//  BootCampApp
//
//  Created by Francisco Landero on 16/10/24.
//

import SwiftUI

// MARK: - Movie
struct Movie: Codable, Identifiable {
    let id: Int
    let title: String
    let posterPath: String?
    let releaseDate: String?
    let adult: Bool?
    let popularity: Double?
    let revenue : Int?
    let budget: Int?
    let imdbID: String?
    let overview : String?
    let tagline: String?
    let genres: String?
    
    var imageURL: URL? {
         URL(string: posterPath ?? "")
    }

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case adult, popularity, overview,revenue, budget, tagline, genres
        case imdbID = "imdb_id"
    }
}

// MARK: Example
extension Movie {
    static let sample = Movie(id: 01,
                              title: "Inception",
                              posterPath: "https://image.tmdb.org/t/p/original//oYuLEt3zVCKq57qu2F8dT7NIa6f.jpg",
                              releaseDate: "2010-07-15T00:00:00.000Z",
                              adult: false,
                              popularity: 83.952,
                              revenue: 332356,
                              budget: 0,
                              imdbID: "tt6793710",
                              overview: "Cobb, a skilled thief who commits corporate espionage by infiltrating the subconscious of his targets is offered a chance to regain his old life as payment",
                              tagline: "The prequel to the cult film El Crack",
                              genres: "Drama, Thriller")
}
