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
    
    @StateObject var dataController = DataController() //Aqui eu preciso adicionar a primeira instância do meu dataController, para ter acesso as minhas funções
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ActivitiesView(context: dataController.container.viewContext)
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
        .modelContainer(for: DataItem.self)
    }
}

