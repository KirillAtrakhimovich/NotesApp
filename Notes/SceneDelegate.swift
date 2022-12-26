//
//  SceneDelegate.swift
//  Notes
//
//  Created by Kirill Atrakhimovich on 21.12.22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    let persist = PersistenceManager()
    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
       guard let windowScene = (scene as? UIWindowScene) else { return }
       
        let defaults = UserDefaults.standard
        let key = "isWelcomeNoteCreated"

        if !defaults.bool(forKey: key) {
            let welcomeNote = NoteItem(id: UUID(), noteTitle: "Welcome to the Notes!", note: "Write something here!")
            persist.saveNote(item: welcomeNote)
            defaults.set(true, forKey: key)
        }
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let navController = UINavigationController()
        let home = HomeViewController()
        navController.viewControllers = [home]
        self.window?.rootViewController = navController
        window?.makeKeyAndVisible()
        window?.windowScene = windowScene
    }
}
