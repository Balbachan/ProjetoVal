//
//  DataController.swift
//  ProjetoVal
//
//  Created by Gabriel Vicentin Negro on 20/11/23.
//

import Foundation
import CoreData

class DataController: ObservableObject { //Essa classe é para inicializar o conteiner do meu CoreData
    
    let container = NSPersistentContainer(name: "Model")
    
    init() {
        container.loadPersistentStores{ descricao, erro in
            if let erro = erro{
                print("Erro ao pegar os dados \(erro.localizedDescription)")
            }
        }
    }
}

