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
