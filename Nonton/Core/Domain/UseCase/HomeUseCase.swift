//
//  HomeUseCase.swift
//  Nonton
//
//  Created by IT Division on 13/11/20.
//

import Foundation
import Combine

enum MovieEndPoints: String {
    case popular
    case nowPlaying = "now_playing"
    case upcoming
    case topRated = "top_rated"
}

protocol HomeUseCase {
    func getMovieList(from endpoint: MovieEndPoints) -> AnyPublisher<MovieResponseWrapper, Error>
}
