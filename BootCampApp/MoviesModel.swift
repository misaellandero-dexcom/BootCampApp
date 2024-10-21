//
//  MoviesModel.swift
//  BootCampApp
//
//  Created by Francisco Landero on 18/10/24.
//

import SwiftUI

@Observable class MoviesModel {
    
    var movies = [Movie]()
    private let service = MoviesService()
    
    func fetchMovies() {
        Task {
            movies = await service.fetchMovies()
        }
    }
    
    func searchMovieByTitle(title : String) {
        Task {
            movies = await service.fetchMovies(title: title)
        }
    }
}
