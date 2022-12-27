//
//  PersistenceManager.swift
//  Notes
//
//  Created by Kirill Atrakhimovich on 27.12.22.
//

import Foundation

protocol PersistenceManager {
    func saveNote(item: Note)
    func getNotes() -> [Note]
    func deleteNote(item: Note)
}
