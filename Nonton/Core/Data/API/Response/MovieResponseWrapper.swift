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
    let id: Int?
    let title: String?
    let backdropPath: String?
    let posterPath: String?
    let overview: String?
    let voteAverage: Double?
    let voteCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case backdropPath = "backdrop_path"
        case posterPath = "poster_path"
        case overview
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try values.decodeIfPresent(Int.self, forKey: .id)
        self.backdropPath = try values.decodeIfPresent(String.self, forKey: .backdropPath)
        self.title = try values.decodeIfPresent(String.self, forKey: .title)
        self.posterPath = try values.decodeIfPresent(String.self, forKey: .posterPath)
        self.overview = try values.decodeIfPresent(String.self, forKey: .overview)
        self.voteAverage = try values.decodeIfPresent(Double.self, forKey: .voteAverage)
        self.voteCount = try values.decodeIfPresent(Int.self, forKey: .voteCount)
    }
}
