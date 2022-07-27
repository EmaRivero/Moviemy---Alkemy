//
//  MovieListViewModel.swift
//  Moviemy
//
//  Created by Ema Rivero on 19/07/2022.
//

import Foundation



class MovieListViewModel {
    
    private var service: MovieListService
    private var delegate: MovieListDelegate
    private var movies: [Movie] = [Movie]()
    
    init(service: MovieListService, delegate: MovieListDelegate) {
        self.service = service
        self.delegate = delegate
    }
    
    func getMovies(){
        service.getMovies { movie in
            self.movies = movie
            self.delegate.reloadTable()
        } onError: { [self] error in
            self.delegate.showError(error: error.localizedLowercase)
        }
    }
    
    func moviesCount() -> Int {
        return movies.count
    }
    
    func getMovie(at index: Int) -> Movie {
        return movies[index]
    }
}


