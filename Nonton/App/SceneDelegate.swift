//
//  SceneDelegate.swift
//  Nonton
//
//  Created by IT Division on 13/11/20.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        let homeInteractor = Injector.shared.injectHomeInteractor()
        let favoriteInteractor = Injector.shared.injectFavoriteInteractor()

        let homePresenter = HomePresenter(useCase: homeInteractor)
        let favoritePresenter = FavoritePresenter(useCase: favoriteInteractor)

        let contentView = ContentView()
            .environmentObject(homePresenter)
            .environmentObject(favoritePresenter)

        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
        let docDirPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).map(\.path)[0]
        print("\(docDirPath)")
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }
}
