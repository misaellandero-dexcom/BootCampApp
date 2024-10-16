//
//  MovieModel.swift
//  BootCampApp
//
//  Created by Francisco Landero on 16/10/24.
//

import SwiftUI


struct MovieModel : Identifiable, Codable {
    
    var id: String
    var primaryImage : String
    var titleText : TitleText?
    var releaseYear : ReleaseYear?
    
    
    //Computed properity
    var imageURL: URL? {
        return URL(string: primaryImage)
    }
    
    var unwrappedYear : Int {
        releaseYear?.year ?? 2000
    }
    
    
    
    //For moc and sample content
    static var movieSample1 : MovieModel = MovieModel(id: UUID().uuidString, primaryImage: "https://resizing.flixster.com/-XZAfHZM39UwaGJIFWKAE8fS0ak=/v3/t/NowShowing/10286/10286_aa.jpg", titleText: TitleText(text: "Superman"), releaseYear: ReleaseYear(year: 1997))
    static var movieSample2 : MovieModel = MovieModel(id: UUID().uuidString, primaryImage: "https://images.moviesanywhere.com/e550520706d54c8390e7286cfe8a7ba0/7576269b-8ca6-477f-a8c3-fa441484806d.webp?h=375&resize=fit&w=250", titleText:  TitleText(text: "Superman 2"), releaseYear: ReleaseYear(year: 1997))
    static var movieSample3 : MovieModel = MovieModel(id: UUID().uuidString, primaryImage: "https://static.wikia.nocookie.net/dcmovies/images/a/aa/Poster-superman3.jpg/revision/latest?cb=20100518210919", titleText: TitleText(text: "Superman 3"), releaseYear: ReleaseYear(year: 1997))
    
    
    static var movieSamples = [movieSample1 ,movieSample2, movieSample3]
    
    
    // Coding keys to map the response fields
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case titleText = "titleText"
        case releaseYear
        case primaryImage = "primaryImage.url" // Directly extract image URL from nested object
    }
   
}


struct ReleaseYear : Codable{
    var year: Int
    // Keys to map the response fields
    enum CodingKeys: String, CodingKey {
        case year
    }
}

struct TitleText : Codable{
    var text: String
    // Keys to map the response fields
    enum CodingKeys: String, CodingKey {
        case text
    }
}

struct primaryImage : Codable{
    var text: String
    // Keys to map the response fields
    enum CodingKeys: String, CodingKey {
        case text
    }
}


struct MovieResponse: Codable {
    let results: [MovieModel]
}
 
