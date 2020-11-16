//
//  Injector.swift
//  Nonton
//
//  Created by IT Division on 13/11/20.
//

import Foundation
import RealmSwift

final class Injector {

    static let shared = Injector()
    private init() { }

    private func injectRepository() -> MovieRepositoryProtocol {
        let realm = try? Realm()

        let local = LocalInstance.shared(realm)
        let api = APIInstance.shared

        return MovieRepository.shared(api, local)
    }

    public func injectHomeInteractor() -> HomeUseCaseProtocol {
        return HomeInteractor(repository: self.injectRepository())
    }

    public func injectDetailInteractor(movieID: Int) -> DetailUseCaseProtocol {
        return DetailInteractor(repository: self.injectRepository(), withID: movieID)
    }
    
    public func injectFavoriteInteractor() -> FavoriteUseCaseProtocol {
        return FavoriteInteractor(repository: self.injectRepository())
    }
}
