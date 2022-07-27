//
//  MovieDetailViewModel.swift
//  Moviemy
//
//  Created by Ema Rivero on 23/07/2022.
//

import Foundation

class MovieDetailViewModel {
    private var movieId: Int
    private var movieDetail: MovieDetail?
    private var delegate: MovieDetailDelegate
    private var service: MovieDetailService
    
    init(movieId: Int, delegate: MovieDetailDelegate , service: MovieDetailService) {
        self.movieId  = movieId
        self.delegate = delegate
        self.service = service
    }
    
    func getMovie() {
        service.getMovies(id: movieId) { movie in
            self.delegate.movieData(data: movie)
        } onError: { showMessage in
            self.delegate.showError(error: showMessage)
        }
    }
}
