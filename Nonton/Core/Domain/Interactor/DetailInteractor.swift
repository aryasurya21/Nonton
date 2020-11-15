//
//  DetailInteractor.swift
//  Nonton
//
//  Created by IT Division on 15/11/20.
//

import Foundation
import Combine

class DetailInteractor: DetailUseCaseProtocol {

    private let repository: MovieRepositoryProtocol

    init(repository: MovieRepositoryProtocol) {
        self.repository = repository
    }

    func getMovieDetail(withID movieID: Int) -> AnyPublisher<MovieModel, Error> {
        return self.repository.getMovieDetail(withID: movieID)
    }
}
