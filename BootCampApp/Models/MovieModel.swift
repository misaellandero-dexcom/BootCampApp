//
//  MovieModel.swift
//  BootCampApp
//
//  Created by Francisco Landero on 16/10/24.
//

import SwiftUI

// MARK: - MovieModelElement
struct Movie: Codable, Identifiable {
    let id: String
    let movieModelID: Int
    let title: String
    let voteAverage: Double
    let voteCount: Int
    let status: Status
    let releaseDate: String?
    let revenue, runtime: Int
    let adult: Bool
    let backdropPath: String?
    let budget: Int
    let homepage: String?
    let imdbID: String?
    let originalLanguage: OriginalLanguage
    let originalTitle, overview: String
    let popularity: Double
    let posterPath: String?
    let tagline, genres, productionCompanies, productionCountries: String?
    let spokenLanguages: String?
    
    //Computed properity
    var imageURL: URL? {
         URL(string: posterPath ?? "")
    }

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case movieModelID = "id"
        case title
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case status
        case releaseDate = "release_date"
        case revenue, runtime, adult
        case backdropPath = "backdrop_path"
        case budget, homepage
        case imdbID = "imdb_id"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case tagline, genres
        case productionCompanies = "production_companies"
        case productionCountries = "production_countries"
        case spokenLanguages = "spoken_languages"
    }
}

enum OriginalLanguage: String, Codable {
    case en = "en"
    case es = "es"
}

enum Status: String, Codable {
    case released = "Released"
}

 
struct MovieResponse: Codable {
    let results: [Movie]
}
 
