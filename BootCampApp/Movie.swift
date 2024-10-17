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

    //UnwrappedValues
    
    var UnwrappedPopularity : Double {
        popularity ?? 0.0
    }
    
    var UnwrappedRevenue: Double {
        Double(revenue ?? Int(0))
    }
    
    var UnwrappedBudget : Double {
        Double(budget ?? Int(0))
    }
    
    var UnwrappedReleaseDate : Date {
        DateFormatter().date(from: releaseDate ?? "") ?? Date()
    }
    
    var gendersArray : [String] {
        genres?.components(separatedBy: ",") ?? []
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
                              posterPath: "https://upload.wikimedia.org/wikipedia/en/2/2e/Inception_%282010%29_theatrical_poster.jpg",
                              releaseDate: "2010-07-15T00:00:00.000Z",
                              adult: false,
                              popularity: 83.952,
                              revenue: 839_030_630,
                              budget: 160_000_000,
                              imdbID: "tt6793710",
                              overview: "Dom Cobb and Arthur are extractors who perform corporate espionage using experimental dream-sharing technology to infiltrate their targets' subconscious and extract information. Their latest target, Saito, is impressed with Cobb's ability to layer multiple dreams within each other. He offers to hire Cobb for the ostensibly impossible job of implanting an idea into a person's subconscious; performing inception on Robert Fischer, the son of Saito's competitor Maurice Fischer, with the idea to dissolve his father's company. In return, Saito promises to clear Cobb's criminal status, allowing him to return home to his children.",
                              tagline: "Your mind is the scene of the crime.",
                              genres: "Action, Adventure, Sci-Fi, Thriller")
}
