
import Foundation


struct Constants {
    static let APIkey = "d63c59d15fdc060e1c41947aa0dfc6b0"
    static let baseURL = "https://api.themoviedb.org"
}


enum APIerror: Error{
    case failedTogetData
}


class APIcaller {

    func getTrendingMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        
           guard let url = URL(string: "\(Constants.baseURL)/3/trending/movie/day?api_key=\(Constants.APIkey)") else {return}
        
           let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
               guard let data = data, error == nil else {return}

               do {
                   let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                   completion(.success(results.results))
                   
               } catch {
                   completion(.failure(APIerror.failedTogetData))
               }
           }
           
           task.resume()
       }

        
    
}
