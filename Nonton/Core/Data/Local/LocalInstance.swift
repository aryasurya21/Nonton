//
//  LocalInstance.swift
//  Nonton
//
//  Created by IT Division on 13/11/20.
//

import Foundation
import Combine
import RealmSwift

protocol LocalInstanceCapabilityProtocol {
    func getMovieList(from endpoint: MovieEndPoints) -> AnyPublisher<[MovieEntity], Error>
    func addMovieList(movies: [MovieEntity]) -> AnyPublisher<Bool, Error>
}

class LocalInstance {
    
    private let realm: Realm?
    
    private init(realm: Realm?){
        self.realm = realm
    }
    
    static let shared: (Realm?) -> LocalInstance = { realm in
        return LocalInstance(realm: realm)
    }
}

extension LocalInstance: LocalInstanceCapabilityProtocol {
    func getMovieList(from endpoint: MovieEndPoints) -> AnyPublisher<[MovieEntity], Error> {
        return Future<[MovieEntity], Error>{ (completion) in
            if let realm = self.realm {
                let movies: Results<MovieEntity> = {
                    realm.objects(MovieEntity.self)
                        .filter("movieCategory='\(endpoint.rawValue)'")
                        .sorted(byKeyPath: "title", ascending: true)
                }()
                completion(.success(movies.toCustomObjects(fromType: MovieEntity.self)))
            } else {
                completion(.failure(DatabaseError.requestFailed))
            }
        }.eraseToAnyPublisher()
    }
    
    func addMovieList(movies: [MovieEntity]) -> AnyPublisher<Bool, Error> {
        return Future<Bool, Error>{ (completion) in
            if let realm = self.realm {
                do {
                    try realm.write {
                        for movie in movies {
                            realm.add(movie)
                        }
                        completion(.success(true))
                    }
                } catch {
                    completion(.failure(DatabaseError.requestFailed))
                }
            } else {
                completion(.failure(DatabaseError.requestFailed))
            }
        }.eraseToAnyPublisher()
    }
}
