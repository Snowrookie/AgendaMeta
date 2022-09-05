//
//  Agenda_SwiftApp.swift
//  Agenda Swift
//
//  Created by Antonio Carlos Dourado on 31/08/22.
//

import SwiftUI

@main
struct Agenda_SwiftApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
