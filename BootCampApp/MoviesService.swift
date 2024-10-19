//
//  MoviesService.swift
//  BootCampApp
//
//  Created by Ines Pacheco on 10/18/24.
//
import Foundation
import Combine

class MoviesService {
    private let apiKey = "6f2a920aecmshc438c8c3c28f768p1c88d5jsn9548c28b02f5"
    private let headerhost = "moviedatabase8.p.rapidapi.com"
    private let baseURL = "https://moviedatabase8.p.rapidapi.com/"
    
    /// Fetches a list of movies
    func fetchMovies(title: String? = nil) async -> [Movie] {
        var moviesURLString = baseURL + "Random/20"
        
        if let title {
            moviesURLString = baseURL + "Search/" + title
        }
        
        guard let url = URL(string: moviesURLString) else {
            print("Invalid URL")
            return []
        }
        
        // Prepare the headers for the request
        let headers = [
            "x-rapidapi-key": apiKey,
            "x-rapidapi-host": headerhost
        ]
        
        // Create the request
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        do {
            // Execute the network call
            let (data, response) = try await URLSession.shared.data(from: url)
            print("Response: \(response)")
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                print("Invalid status code response")
                return []
            }
            
            do {
                let decoder = JSONDecoder()
                return try decoder.decode([Movie].self, from: data)
            } catch {
                print("Invalid status code response")
            }
        } catch {
            print("Error fetching movies: \(error)")
        }

        return []
    }
}
