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
                runtime: movie.runtime,
                movieCategory: endpoint.rawValue,
                releaseDate: movie.releaseDate
            )
        }
    }

    class func mapMovieDetailResponsetoModel(from movie: MovieResponse) -> MovieModel {
        return MovieModel(
            id: movie.id ?? 0,
            title: movie.title ?? "",
            backdropPath: movie.backdropPath ?? "",
            posterPath: movie.posterPath ?? "",
            overview: movie.overview ?? "",
            voteAverage: movie.voteAverage ?? 0,
            runtime: movie.runTime ?? 0,
            movieCategory: "",
            releaseDate: movie.releaseDate ?? ""
        )
    }

    class func mapMovieDetailResponsetoEntity(movie: MovieResponse) -> MovieEntity {
        let movieEntity = MovieEntity()
        movieEntity.id = movie.id ?? 0
        movieEntity.title = movie.title ?? ""
        movieEntity.backdropPath = movie.backdropPath ?? ""
        movieEntity.posterPath = movie.posterPath ?? ""
        movieEntity.runtime = movie.runTime ?? 0
        movieEntity.overview = movie.overview ?? ""
        movieEntity.voteAverage = movie.voteAverage ?? 0
        movieEntity.releaseDate = movie.releaseDate ?? ""
        movieEntity.movieCategory = ""
        return movieEntity
    }

    class func mapMovieDetailEntitytoModel(movie: MovieEntity) -> MovieModel {
        return MovieModel(
            id: movie.id,
            title: movie.title,
            backdropPath: movie.backdropPath ,
            posterPath: movie.posterPath,
            overview: movie.overview,
            voteAverage: movie.voteAverage,
            runtime: movie.runtime,
            movieCategory: movie.movieCategory,
            releaseDate: movie.releaseDate
        )
    }
}
