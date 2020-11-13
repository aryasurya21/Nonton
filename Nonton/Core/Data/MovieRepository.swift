//
//  MovieRepository.swift
//  Nonton
//
//  Created by IT Division on 13/11/20.
//

import Foundation
import Combine

protocol MovieRepositoryProtocol {
    func getMovieList(from endpoint: MovieEndPoints) -> AnyPublisher<[MovieModel], Error>
}

class MovieRepository {
    typealias MovieRepositoryInstance = (APIInstance, LocalInstance) -> MovieRepository
    private let apiInstance: APIInstance
    private let localInstance: LocalInstance
    
    private init(apiInstance: APIInstance, localInstance: LocalInstance){
        self.apiInstance = apiInstance
        self.localInstance = localInstance
    }
    
    static let shared: MovieRepositoryInstance = { api, local in
        return MovieRepository(apiInstance: api, localInstance: local)
    }
}

extension MovieRepository: MovieRepositoryProtocol {
    func getMovieList(from endpoint: MovieEndPoints) -> AnyPublisher<[MovieModel], Error> {
        return self.localInstance.getMovieList(from: endpoint)
            .flatMap { result -> AnyPublisher<[MovieModel], Error> in
            if result.isEmpty {
                return self.apiInstance.getMovieList(from: endpoint)
                    .map { MovieMapper.mapMovieResponseToEntity(from: endpoint, movies: $0) }
                    .catch { _ in self.localInstance.getMovieList(from: endpoint) }
                    .flatMap { self.localInstance.addMovieList(movies: $0) }
                    .filter { $0 }
                    .flatMap { _ in self.localInstance.getMovieList(from: endpoint)
                        .map { MovieMapper.mapMovieEntityToModel(from: endpoint, movies: $0) }
                    }.eraseToAnyPublisher()
            } else {
                return self.localInstance.getMovieList(from: endpoint)
                    .map { MovieMapper.mapMovieEntityToModel(from: endpoint, movies: $0) }
                    .eraseToAnyPublisher()
            }
        }.eraseToAnyPublisher()
    }
}
