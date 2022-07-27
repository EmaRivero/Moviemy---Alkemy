//
//  MovieListService.swift
//  Moviemy
//
//  Created by Ema Rivero on 19/07/2022.
//

import Foundation

class MovieListService {
    
    let urlMovies = "\(Constants.baseUrl)/3/movie/popular?api_key=\(Constants.apiKey)&language=en-US&page=1"
    
    func getMovies(onComplete: @escaping ([Movie]) -> Void, onError: @escaping (String) -> Void) {
        ApiManager.shared.getCall(url: urlMovies) { response in
            switch response {
            case .success(let data):
                do {
                    if let safeData = data {
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        let moviesResponse = try decoder.decode(ListMovies.self, from: safeData)
                        onComplete(moviesResponse.results)
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

