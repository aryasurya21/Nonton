//
//  MovieModel.swift
//  Nonton
//
//  Created by IT Division on 13/11/20.
//

import Foundation

struct MovieModel: Equatable, Identifiable {
    let id: Int
    let title: String
    let backdropPath: String
    let posterPath: String
    let overview: String
    let voteAverage: Double
    let voteCount: Int
    let runtime: Int
    let movieCategory: String
    
    var posterImageURL: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500/\(self.posterPath)")!
    }
    
    var backdropURL: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500/\(self.backdropPath)")!
    }
}
