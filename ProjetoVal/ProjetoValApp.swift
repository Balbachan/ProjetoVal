//
//  ProjetoValApp.swift
//  ProjetoVal
//
//  Created by Laura C. Balbachan dos Santos on 08/11/23.
//

import SwiftUI
import SwiftData
import Firebase

@main
struct ProjetoValApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ActivitiesView()
        }
        .modelContainer(for: DataItem.self)
    }
}

