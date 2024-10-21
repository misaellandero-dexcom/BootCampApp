//
//  MoviesModel.swift
//  BootCampApp
//
//  Created by Francisco Landero on 18/10/24.
//

import SwiftUI

@Observable class MoviesModel {
    
    var movies = [Movie]()
    
    func fetchMovies() {
        featchMockMovies()
    }
    
    func searchMovieByTitle(title : String) {
        featchMockMovies()
    }
    
    func featchMockMovies(){
        let moviesData = Data(mockResponse.utf8)
               
               do {
                   movies = try JSONDecoder().decode([Movie].self, from: moviesData)
               } catch {
                   print("Failed to decode mock data: \(error)")
               }
    }
}
