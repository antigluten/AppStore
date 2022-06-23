//
//  SceneDelegate.swift
//  AppStore
//
//  Created by Vladimir Gusev on 21.06.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = HomeTabBarController()
        window.makeKeyAndVisible()
        self.window = window
    }
}

