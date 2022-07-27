//
//  MovieDetail.swift
//  Moviemy
//
//  Created by Ema Rivero on 24/07/2022.
//

import Foundation

struct MovieDetail: Codable {
    let originalTitle: String?
    let posterPath: String
    let id: Int
    let overview: String?
    let releaseDate: String?
    let voteAverage: Double?
}
