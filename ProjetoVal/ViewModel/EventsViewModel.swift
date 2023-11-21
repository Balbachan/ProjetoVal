//
//  EventsViewModel.swift
//  ProjetoVal
//
//  Created by Laura C. Balbachan dos Santos on 19/11/23.
//

import Foundation
import FirebaseFirestore

class ViewModel: ObservableObject {
    @Published var event = [Event]()
    var allEvents = [Event]()
    
    func getData() {
        let db = Firestore.firestore()
        db.collection("Events").getDocuments { snapshot, error in
            
            if error == nil {
                if let snapshot = snapshot {
                    
                    self.event = snapshot.documents.map { document in
                        return Event(id: document.documentID,
                                     about: document["about"] as? String ?? "",
                                     address: document["address"] as? String ?? "",
                                     audience: document["audience"] as? String ?? "",
                                     date: document["date"] as? String ?? "",
                                     image: document["image"] as? String ?? "",
                                     language: document["language"] as? String ?? "",
                                     time_close: document["time_close"] as? String ?? "",
                                     time_open: document["time_open"] as? String ?? "",
                                     title: document["title"] as? String ?? "",
                                     type: document["type"] as? String ?? "various")
                    }
                }
            } else {
                
            }
        }
    }
}
