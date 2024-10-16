//
//  MoviesVIewModel.swift
//  BootCampApp
//
//  Created by Francisco Landero on 16/10/24.
//

import SwiftUI
import Combine

@Observable class MoviesViewModel {
    //var searchQuery : String = ""
    var movies = [Movie]()
    
    // we use AnyCancellable to stop the network call once we finish using it
    private var cancellables = Set<AnyCancellable>()
    
    func searchMovies(byTitle title : String){
        // Prepare the headers for the request
        let headers = [
            "x-rapidapi-key": "c46f25b40cmsh4c999bdc420d47cp151b19jsnd1c492148d5a",
            "x-rapidapi-host": "moviedatabase8.p.rapidapi.com"
        ]
        // Construct the URL using the provided title
        let urlString = "https://moviedatabase8.p.rapidapi.com/Search/\(title)"
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        // Create the request
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        // Execute the network call
        URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { output in
                // Throw an error if the response is not HTTP or status code is not 200
                guard let response = output.response as? HTTPURLResponse, response.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                //self.decodeMovies(from: output.data)
                return output.data
            }
            .decode(type: [Movie].self, decoder: JSONDecoder())
            .map { $0 }
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("Error fetching movies: \(error)")
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] movies in
                self?.movies = movies
            })
            .store(in: &cancellables) // Store the subscription
    }
    
    func decodeMovies(from data: Data) {
        let decoder = JSONDecoder()
        do {
            // Try to decode the data into your MovieResponse model
            let movieResponse = try decoder.decode(MovieResponse.self, from: data)
            print("Successfully decoded movies: \(movieResponse.results)")
        } catch let DecodingError.dataCorrupted(context) {
            print("Data corrupted: \(context.debugDescription)")
        } catch let DecodingError.keyNotFound(key, context) {
            print("Key '\(key)' not found: \(context.debugDescription)")
        } catch let DecodingError.typeMismatch(type, context) {
            print("Type mismatch for type '\(type)': \(context.debugDescription)")
        } catch let DecodingError.valueNotFound(value, context) {
            print("Value '\(value)' not found: \(context.debugDescription)")
        } catch {
            // General error
            print("Failed to decode: \(error.localizedDescription)")
        }
    }
    
}

