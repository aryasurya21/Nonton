//
//  MovieResponseWrapper.swift
//  Nonton
//
//  Created by IT Division on 13/11/20.
//

import Foundation

struct MovieResponseWrapper: Decodable {
    var results: [MovieResponse]
}

struct MovieResponse: Decodable {
    let id: Int
    let title: String
    let backdropPath: String?
    let posterPath: String?
    let overview: String?
    let voteAverage: Double?
    let voteCount: Int?
    let runtime: Int?
}
