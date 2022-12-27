//
//  SceneDelegate.swift
//  Notes
//
//  Created by Kirill Atrakhimovich on 21.12.22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    let persist: PersistenceManager = CoreDataManager()
    
    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
               
        window = UIWindow(frame: UIScreen.main.bounds)
      
        window?.rootViewController = createRootController()
        window?.makeKeyAndVisible()
        window?.windowScene = windowScene
    }
    
    private func createRootController() -> UINavigationController {
        let navController = UINavigationController()
        let home = HomeViewController()
        navController.viewControllers = [home]
        return navController
    }

    private func createWelcomeNote() {
        let defaults = UserDefaults.standard
        let key = "isWelcomeNoteCreated"

        if !defaults.bool(forKey: key) {
            let welcomeNote = NoteItem(id: UUID(), noteTitle: "Welcome to the Notes!", note: "Write something here!")
            let welcomeFont = NoteFont()
            let note = Note(noteItem: welcomeNote, noteFont: welcomeFont)
            persist.saveNote(item: note)
            defaults.set(true, forKey: key)
        }
    }
}
