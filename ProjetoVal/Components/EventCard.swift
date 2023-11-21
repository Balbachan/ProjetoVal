//
//  EventCard.swift
//  ProjetoVal
//
//  Created by Laura C. Balbachan dos Santos on 12/11/23.
//

import SwiftUI
import CoreData


struct EventCard: View, Identifiable {
    let id = UUID()
    @State var isSaved: Bool = false
    var eventId: String //Preciso receber o id do evento para salvá-lo no CoreData
    var cardAbout: String
    var cardAddress: String
    var cardAudience: String
    var cardDate: String
    var cardImage: String
    var cardLanguage: String
    var cardClose: String
    var cardOpen: String
    var cardTitle: String
    @State var savedItems: [EventCard] = []
    
    //Coisas do CoreData
    @Environment(\.managedObjectContext) var context //Contexto da minha DataController
    
    @ObservedObject var myDataController: MyDataController //Aqui vou receber aquela minha primeira instância, para acessar minhas funções
    
    @FetchRequest(sortDescriptors: []) var coreData: FetchedResults<Saved> //Aqui eu recebo no vetor coreData todos os itens que o usuário tem em seu dispositivo da entidade Saved da minha Model
    
    init(eventId: String,cardAbout: String, cardAddress: String, cardAudience: String, cardDate: String, cardImage: String, cardLanguage: String, cardClose: String, cardOpen: String, cardTitle: String, savedItems: [EventCard] = [], context: NSManagedObjectContext) {
        self.eventId = eventId
        self.cardAbout = cardAbout
        self.cardAddress = cardAddress
        self.cardAudience = cardAudience
        self.cardDate = cardDate
        self.cardImage = cardImage
        self.cardLanguage = cardLanguage
        self.cardClose = cardClose
        self.cardOpen = cardOpen
        self.cardTitle = cardTitle
        self.myDataController = MyDataController(context: context)
    }
    
    var body: some View {
        NavigationLink {
            EventsDetailsView(isSaved: $isSaved, savedItems: $savedItems, eventId: eventId, descAbout: cardAbout, descAddress: cardAddress, descAudience: cardAudience, descDate: cardDate, descImage: cardImage, descLanguage: cardLanguage, descClose: cardClose, descOpen: cardOpen, descTitle: cardTitle, context: context)
        } label: {
            VStack(alignment: .leading, spacing: 0) {
                VStack {
                    Image("\(cardImage)")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                    
                }
                .frame(width: 245, height: 131)
                .background(.superLightOrange)
                .clipShape(UnevenRoundedRectangle(
                    cornerRadii: .init(
                        topLeading: 15,
                        bottomLeading: 0,
                        bottomTrailing: 0,
                        topTrailing: 15),
                    style: .continuous)
                )
                
                HStack {
                    // Texto do Card
                    VStack(alignment: .leading) {
                        Text("\(cardTitle)")
                            .font(.callout)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.leading)
                        
                        Text("\(cardDate)")
                            .font(.subheadline)
                            .fontWeight(.light)
                    }
                    .padding()
                    Spacer()
                    
                    // Botão de Salvar
                    Button(action: {
                        print("Botão pressionado!")
                        if !myDataController.isEventSaved(eventId: eventId) {
                            // Se o evento não estiver salvo, adicione-o à lista de salvos
                            
                            //                            let event = EventCard(isSaved: true, cardAbout: cardAbout, cardAddress: cardAddress, cardAudience: cardAudience, cardDate: cardDate, cardImage: cardImage, cardLanguage: cardLanguage, cardClose: cardClose, cardOpen: cardOpen, cardTitle: cardTitle, context: context)
                            //                            savedItems.append(event)
                                                        
                            
                            myDataController.saveEvent(eventId: eventId) //Aqui eu salvo o evento no coreData com seu id
                            print("Salvei legal aqui o evento no CoreData")
                            isSaved.toggle()
                            
                        } else {
                            // Se já estiver salvo, remove da lista de salvos
                            //                            if let index = savedItems.firstIndex(where: { $0.cardTitle == cardTitle }) {
                            //                                savedItems.remove(at: index)
                            //                            }
                            
                            myDataController.removeEvent(eventId: eventId) //Removo o evento do CoreData
                            print("Removi legal aqui o evento no CoreData")
                            isSaved.toggle()
                        }
                    }, label: {
                        Text("")
                        
                    })
                    .buttonStyle(SaveButton(isSaved: $isSaved))
                    .padding()
                }
                .frame(width: 245, height: 64)
                .background(.projectWhite)
                .clipShape(UnevenRoundedRectangle(
                    cornerRadii: .init(
                        topLeading: 0,
                        bottomLeading: 15,
                        bottomTrailing: 15,
                        topTrailing: 0),
                    style: .continuous)
                )
            }
            .tint(.projectBlack)
        }
        .onAppear{ //Aqui ao carregar o card, seu isSaved recebe true ou false dependendo se ele esta salvo no coreData ou nao, precisa disso para quando o app iniciar, ele definir a variavel isSaved, que é local de cada card, para seu valor real que está no coreData, porem com essa linha de codigo o qualquer preview de views que chamam essa vao crashar, mas a logica só funciona se tiver essa linha.
            self.isSaved = myDataController.isEventSaved(eventId: self.eventId)
        }
    }
}

#Preview {
    EventCard(eventId: "", cardAbout: "Legal", cardAddress: "Legal", cardAudience: "Legal", cardDate: "Legal", cardImage: "book", cardLanguage: "Legal", cardClose: "Legal", cardOpen: "Legal", cardTitle: "Legal", context: DataController().container.viewContext)
}
