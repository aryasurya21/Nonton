//
//  DetailUseCase.swift
//  Nonton
//
//  Created by IT Division on 15/11/20.
//

import Foundation
import Combine

protocol DetailUseCaseProtocol {
    func getMovieDetail(withID movieID: Int) -> AnyPublisher<MovieModel, Error>
}
