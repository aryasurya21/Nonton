//
//  APIInstance.swift
//  Nonton
//
//  Created by IT Division on 13/11/20.
//

import Foundation
import Combine
import Alamofire

protocol APICapabilityProtocol {
    func getMovieList(from endpoint: MovieEndPoints) -> AnyPublisher<[MovieResponse], Error>
}

class APIInstance {
    private let baseURL = "https://api.themoviedb.org/3"
    private let apiKey = "913b4714c3644e3442541d832c16e6fe"
    static let shared = APIInstance()
    private init(){}
}

extension APIInstance: APICapabilityProtocol {
    
    func getMovieList(from endpoint: MovieEndPoints) -> AnyPublisher<[MovieResponse], Error>{
        return Future<[MovieResponse], Error> { (completion) in
            if let url = URL(string: "\(self.baseURL)/movie/\(endpoint.rawValue)") {
                AF.request(url).validate().responseDecodable(of: MovieResponseWrapper.self) { (response) in
                    switch response.result {
                    case .success(let data):
                        completion(.success(data.results))
                    case .failure:
                        completion(.failure(MovieError.invalidEndpoint))
                    }
                }
            }
        }.eraseToAnyPublisher()
    }
}
