//
//  SceneDelegate.swift
//  Notes
//
//  Created by Kirill Atrakhimovich on 21.12.22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(frame: UIScreen.main.bounds)
        let navController = UINavigationController()
        let home = NotesViewController()
        navController.viewControllers = [home]
        self.window?.rootViewController = navController
        window?.makeKeyAndVisible()
        window?.windowScene = windowScene
    }
}
