//
//  EventsDetailsView.swift
//  ProjetoVal
//
//  Created by Laura C. Balbachan dos Santos on 19/11/23.
//

import SwiftUI
import CoreData

struct EventsDetailsView: View {
    @Binding var isSaved: Bool
    @Binding var savedItems: [EventCard]
    var eventId: String
    var descAbout: String
    var descAddress: String
    var descAudience: String
    var descDate: String
    var descImage: String
    var descLanguage: String
    var descClose: String
    var descOpen: String
    var descTitle: String
    
    //Coisas do CoreData
    @Environment(\.managedObjectContext) var context //Contexto da minha DataController
    
    @ObservedObject var myDataController: MyDataController //Aqui vou receber aquela minha primeira instância, para acessar minhas funções
    
    @FetchRequest(sortDescriptors: []) var coreData: FetchedResults<Saved> //Aqui eu recebo no vetor coreData todos os itens que o usuário tem em seu dispositivo da entidade Saved da minha Model
    
    init(isSaved: Binding<Bool>, savedItems: Binding<[EventCard]>, eventId: String, descAbout: String, descAddress: String, descAudience: String, descDate: String, descImage: String, descLanguage: String, descClose: String, descOpen: String, descTitle: String, context: NSManagedObjectContext) {
        self._isSaved = isSaved
        self._savedItems = savedItems
        self.eventId = eventId
        self.descAbout = descAbout
        self.descAddress = descAddress
        self.descAudience = descAudience
        self.descDate = descDate
        self.descImage = descImage
        self.descLanguage = descLanguage
        self.descClose = descClose
        self.descOpen = descOpen
        self.descTitle = descTitle
        self.myDataController = MyDataController(context: context)
    }
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading) {
                VStack {
                    Image("\(descImage)")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 150)
                    
                }
                .frame(width: 393, height: 262)
                .background(.superLightOrange)
                
                
                HStack(alignment: .center) {
                    Text("\(descTitle)")
                        .font(.title)
                        .bold()
                        .padding(.horizontal, 10)
                    
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
                
                HStack(alignment: .center) {
                    VStack(alignment: .leading, spacing: 10) {
                        Image(systemName: "mappin")
                            .foregroundStyle(.darkOrange)
                            .padding(5)
                            .background(.superLightOrange)
                            .clipShape(Circle())
                        
                        Image(systemName: "calendar")
                            .foregroundStyle(.darkOrange)
                            .padding(5)
                            .background(.superLightOrange)
                            .clipShape(Circle())
                        
                        Image(systemName: "clock")
                            .foregroundStyle(.darkOrange)
                            .padding(5)
                            .background(.superLightOrange)
                            .clipShape(Circle())
                        
                        Image(systemName: "t.bubble")
                            .foregroundStyle(.darkOrange)
                            .padding(5)
                            .background(.superLightOrange)
                            .clipShape(Circle())
                        
                        Image(systemName: "person")
                            .foregroundStyle(.darkOrange)
                            .padding(5)
                            .background(.superLightOrange)
                            .clipShape(Circle())
                    }
                    
                    VStack(alignment: .leading, spacing: 20) {
                        Text("\(descAddress)")
                            .font(.callout)
                        
                        Text("\(descDate)")
                            .font(.callout)
                        
                        Text("\(descOpen) - \(descClose)")
                            .font(.callout)
                        
                        Text("\(descLanguage)")
                            .font(.callout)
                        
                        Text("\(descAudience)")
                            .font(.callout)
                    }
                    
                }
                .padding(.horizontal, 10)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("About")
                        .font(.title3)
                        .bold()
                    Text("\(descAbout)")
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 10)
                
            }
        }
    }
}


//#Preview {
//    EventsDetailsView(isSaved: .constant(true), savedItems: [], descAbout: "Lorem ipsum dolor sit amet consectetur. Tortor tristique est ullamcorper penatibus nulla. Euismod suspendisse ut nisl in ut interdum. Non quis erat convallis a montes auctor proin. Dui et netus in pretium.", descAddress: "Endereço Maneiro", descAudience: "General Public", descDate: "10/01/2024", descImage: "book", descLanguage: "Portuguese", descClose: "10 PM", descOpen: "10 AM", descTitle: "Super Fashion Show")
//}
