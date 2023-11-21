//
//  SavedEventsView.swift
//  ProjetoVal
//
//  Created by Laura C. Balbachan dos Santos on 19/11/23.
//

import SwiftUI
import CoreData

struct SavedEventsView: View {
    @ObservedObject var model = ViewModel()
    
    //Coisas do CoreData
    @Environment(\.managedObjectContext) var context //Contexto da minha DataController
    
    @ObservedObject var myDataController: MyDataController //Aqui vou receber aquela minha primeira instância, para acessar minhas funções
    
    @FetchRequest(sortDescriptors: []) var coreData: FetchedResults<Saved> //Aqui eu recebo no vetor coreData todos os itens que o usuário tem em seu dispositivo da entidade Saved da minha Model
    
    init(context: NSManagedObjectContext) {
        self.myDataController = MyDataController(context: context)
        model.getData()
    }

    var body: some View {
        ScrollView{
            VStack{
                ForEach(model.event, id: \.id) { item in //Para cada evento
                    if myDataController.isEventSaved(eventId: item.id){ //Eu checo no CoreData para ver se esse o id desse evento esta no CoreData, se estiver eu mostro, se não, não acontece nada
                        EventCard(
                            eventId: item.id,
                            cardAbout: item.about,
                            cardAddress: item.address,
                            cardAudience: item.audience,
                            cardDate: item.date,
                            cardImage: item.image,
                            cardLanguage: item.language,
                            cardClose: item.time_close,
                            cardOpen: item.time_open,
                            cardTitle: item.title,
                            context: context
                        )
                    }
                }
                
            }
        }
    }
}



#Preview {
    SavedEventsView(context: DataController().container.viewContext)
}
