//
//  EventGrid.swift
//  ProjetoVal
//
//  Created by Laura C. Balbachan dos Santos on 20/11/23.
//

import SwiftUI
import CoreData

struct EventGrid: View {
    @ObservedObject var model = ViewModel()
    @State var eventList: [EventCard] = []
    
    //Coisas do CoreData
    @Environment(\.managedObjectContext) var context //Contexto da minha DataController
    
    @ObservedObject var myDataController: MyDataController //Aqui vou receber aquela minha primeira instância, para acessar minhas funções
    
    @FetchRequest(sortDescriptors: []) var coreData: FetchedResults<Saved> //Aqui eu recebo no vetor coreData todos os itens que o usuário tem em seu dispositivo da entidade Saved da minha Model
    
    init(context: NSManagedObjectContext) {
        self.myDataController = MyDataController(context: context)
        model.getData()
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Filtrar os eventos por categoria
                let shows = model.event.filter { $0.type == "show" }
                let sports = model.event.filter { $0.type == "sports" }
                let clubs = model.event.filter { $0.type == "club" }
                
                // Mostrar eventos de cada categoria lado a lado
                Grid {
                    VStack(alignment: .leading) {
                        Text("Shows")
                            .bold()
                            .padding(.horizontal, 20)
                        ScrollView(.horizontal) {
                            GridRow {
                                HStack {
                                    displayEvents(events: shows, context: context)
                                        .padding(.leading, 20)
                                }
                            }
                        }
                        .scrollIndicators(.hidden)
                    }
                    .padding(.vertical, 10)
                    
                    VStack(alignment: .leading) {
                        Text("Sports")
                            .bold()
                            .padding(.horizontal, 20)
                        ScrollView(.horizontal) {
                            GridRow {
                                HStack {
                                    displayEvents(events: sports, context: context)
                                        .padding(.leading, 20)
                                }
                            }
                        }
                        .scrollIndicators(.hidden)
                    }
                    .padding(.vertical, 10)
                    
                    VStack(alignment: .leading) {
                        Text("Clubs")
                            .bold()
                            .padding(.horizontal, 20)
                        ScrollView(.horizontal) {
                            GridRow {
                                HStack {
                                    displayEvents(events: clubs, context: context)
                                        .padding(.leading, 20)
                                }
                            }
                        }
                        .scrollIndicators(.hidden)
                    }
                    .padding(.vertical, 10)
                    
                }
            }
            .padding(.vertical, 30)
        }
    }
}

// Crie uma função para exibir os eventos de cada categoria
func displayEvents(events: [Event], context: NSManagedObjectContext) -> some View {
    ForEach(events, id: \.id) { item in
        EventCard(
            eventId: item.id, //Tive que adicionar passar o id
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


#Preview {
    EventGrid(context: DataController().container.viewContext)
}
