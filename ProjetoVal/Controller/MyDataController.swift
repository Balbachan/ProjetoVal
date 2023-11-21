//
//  MyDataController.swift
//  ProjetoVal
//
//  Created by Gabriel Vicentin Negro on 20/11/23.
//

import Foundation
import CoreData

class MyDataController: ObservableObject { //Nessa classe eu vou possuir as funções que vão me ajudar a excluir e adicionar eventos no coredata
    var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func saveContext() {
        do {
            try context.save()
        } catch {
            print("Não foi possível salvar os dados: \(error.localizedDescription)")
        }
    }
    
    func saveEvent(eventId: String) { //Essa função vai salvar um evento no CoreData
        let saved = Saved(context: context)
        saved.id = eventId
        saved.isSaved = true
        saveContext()
    }
    
    func removeEvent(eventId: String) { //Essa função vai remover um evento do CoreData
        let fetchRequest: NSFetchRequest<Saved> = Saved.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", eventId)
        
        do {
            let savedEvents = try context.fetch(fetchRequest)
            for savedEvent in savedEvents {
                context.delete(savedEvent)
            }
            saveContext()
        } catch {
            print("Erro ao excluir o evento: \(error.localizedDescription)")
        }
    }
    
    func isEventSaved(eventId: String) -> Bool { //Essa função vai checar se certo evento está no CoreData
        let fetchRequest: NSFetchRequest<Saved> = Saved.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", eventId)
        
        do {
            let results = try context.fetch(fetchRequest)
            return !results.isEmpty
        } catch {
            print("Erro ao verificar o evento salvo: \(error.localizedDescription)")
            return false
        }
    }
}

