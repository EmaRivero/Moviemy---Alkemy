//
//  MovieDetailService.swift
//  Moviemy
//
//  Created by Ema Rivero on 23/07/2022.
//

import Foundation

class MovieDetailService {
    
    func getMovies(id: Int, onComplete: @escaping (MovieDetail) -> Void, onError: @escaping (String) -> Void) {
        let urlMovies = "\(Constants.baseUrl)/3/movie/\(id)?api_key=\(Constants.apiKey)"
        ApiManager.shared.getCall(url: urlMovies) { response in
            switch response {
            case .success(let data):
                do {
                    if let safeData = data {
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        let movieResponse = try decoder.decode(MovieDetail.self, from: safeData)
                        onComplete(movieResponse)
                    }
                }  catch {
                    onError("fallo la conversion")
                }
            case .failure(_):
                onError("fallo la conexion a la api")
            }
        }
    }
}
