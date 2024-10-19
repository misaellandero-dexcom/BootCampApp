import Foundation

class MoviesService {
    
    private let apiKey = "c46f25b40cmsh4c999bdc420d47cp151b19jsnd1c492148d5a"
    private let headerhost = "moviedatabase8.p.rapidapi.com"
    private let baseURL = "https://moviedatabase8.p.rapidapi.com/"
    
    /// Fetches a list of movies, either randomly or by title
    func fetchMovies(title: String? = nil) async -> [Movie] {
        // Construct the URL for the API call
        var moviesURLString = baseURL + "Random/20"
        
        // If a title is provided, update the URL for searching by title
        if let title = title?.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) {
            moviesURLString = baseURL + "Search/" + title
        }
        
        // Ensure the URL is valid
        guard let url = URL(string: moviesURLString) else {
            print("Invalid URL")
            return []
        }
        
        
        // Prepare the headers for the request
        let headers = [
            "x-rapidapi-key": apiKey,
            "x-rapidapi-host": headerhost
        ]
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        do {
            // Execute the network call and wait for the response
            let (data, response) = try await URLSession.shared.data(for: request)
            
            // Check if the response is valid and has a status code of 200
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("Error: Invalid status code \(String(describing: response))")
                return []
            }
            
            // Decode the movies from the data and filter out adult movies
            return (decodeMovies(from: data) ?? []).filter { !$0.isAdult }
        } catch {
            print("Error fetching movies: \(error.localizedDescription)")
            return []
        }
    }
    
    /// Decodes the movies from the received data
    func decodeMovies(from data: Data) -> [Movie]? {
        let decoder = JSONDecoder()
        do {
            // Try to decode the data into an array of movies
            let movieResponse = try decoder.decode([Movie].self, from: data)
            print("Successfully decoded movies: \(movieResponse)")
            return movieResponse
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
        return nil
    }
}
