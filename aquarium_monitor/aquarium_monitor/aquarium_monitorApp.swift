//
//  aquarium_monitorApp.swift
//  aquarium_monitor
//
//  Created by Robert N. Brown III on 10/25/22.
//

import SwiftUI

@main
struct aquarium_monitorApp: App {
    @StateObject private var dataController = DataController()
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
