//
//  Datacontroller.swift
//  aquarium_monitor
//
//  Created by Robert N. Brown III on 11/8/22.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    let container = NSPersistentContainer (name: "aquarium")
    
    init() {
        container.loadPersistentStores{ description, error in
            if let error = error {
                print ("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
