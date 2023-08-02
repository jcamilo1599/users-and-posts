//
//  UsersApp.swift
//  Users
//
//  Created by Juan Camilo Marín Ochoa on 1/08/23.
//

import SwiftUI

@main
struct UsersApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
