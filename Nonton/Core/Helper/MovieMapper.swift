//
//  InstanceMapper.swift
//  Nonton
//
//  Created by IT Division on 13/11/20.
//

import Foundation

class MovieMapper {
    class func mapMovieResponseToEntity(from endpoint: MovieEndPoints, movies: [MovieResponse]) -> [MovieEntity] {
        return movies.map { movie in
            let entity = MovieEntity()
            entity.id = movie.id ?? 0
            entity.title = movie.title ?? ""
            entity.backdropPath = movie.backdropPath ?? ""
            entity.posterPath = movie.posterPath ?? ""
            entity.overview = movie.overview ?? ""
            entity.voteAverage = movie.voteAverage ?? 0.0
            entity.voteCount = movie.voteCount ?? 0
            entity.movieCategory = endpoint.rawValue
            return entity
        }
    }
    
    class func mapMovieEntityToModel(from endpoint: MovieEndPoints, movies: [MovieEntity]) -> [MovieModel] {
        return movies.map { movie in
            return MovieModel(
                id: movie.id,
                title: movie.title,
                backdropPath: movie.backdropPath ,
                posterPath: movie.posterPath,
                overview: movie.overview,
                voteAverage: movie.voteAverage,
                voteCount: movie.voteCount,
                runtime: movie.runtime,
                movieCategory: endpoint.rawValue
            )
        }
    }
}
