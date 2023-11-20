//
//  EventGrid.swift
//  ProjetoVal
//
//  Created by Laura C. Balbachan dos Santos on 20/11/23.
//

import SwiftUI

struct EventGrid: View {
    @ObservedObject var model = ViewModel()
    @State var eventList: [EventCard] = []
    
    init() {
        model.getData()
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Filtrar os eventos por categoria
                let shows = model.event.filter { $0.type == "show" }
                let sports = model.event.filter { $0.type == "sports" }
                let clubs = model.event.filter { $0.type == "club" }
                let various = model.event.filter { $0.type == "various" }
                
                // Mostrar eventos de cada categoria lado a lado
                Grid {
                    VStack(alignment: .leading) {
                        Text("Shows")
                            .bold()
                            .padding(.horizontal, 20)
                        ScrollView(.horizontal) {
                            GridRow {
                                HStack {
                                    displayEvents(events: shows)
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
                                    displayEvents(events: sports)
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
                                    displayEvents(events: clubs)
                                        .padding(.leading, 20)
                                }
                            }
                        }
                        .scrollIndicators(.hidden)
                    }
                    .padding(.vertical, 10)
                    
                    VStack(alignment: .leading) {
                        Text("Various")
                            .bold()
                            .padding(.horizontal, 20)
                        ScrollView(.horizontal) {
                            GridRow {
                                HStack {
                                    displayEvents(events: various)
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
func displayEvents(events: [Event]) -> some View {
    ForEach(events, id: \.id) { item in
        EventCard(
            cardAbout: item.about,
            cardAddress: item.address,
            cardAudience: item.audience,
            cardDate: item.date,
            cardImage: item.image,
            cardLanguage: item.language,
            cardClose: item.time_close,
            cardOpen: item.time_open,
            cardTitle: item.title
        )
    }
}


#Preview {
    EventGrid()
}
