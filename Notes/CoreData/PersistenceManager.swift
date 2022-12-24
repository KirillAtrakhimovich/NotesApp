//
//  PersistenceManager.swift
//  Notes
//
//  Created by Kirill Atrakhimovich on 24.12.22.
//

import UIKit
import CoreData

// swiftlint:disable force_cast

class PersistenceManager {
    
    let context = (UIApplication.shared.delegate as!
                   AppDelegate).persistentContainer.viewContext
    
    
}
