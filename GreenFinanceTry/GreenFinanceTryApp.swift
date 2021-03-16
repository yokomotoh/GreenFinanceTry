//
//  GreenFinanceTryApp.swift
//  GreenFinanceTry
//
//  Created by vincent schmitt on 16/03/2021.
//

import SwiftUI

@main
struct GreenFinanceTryApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
