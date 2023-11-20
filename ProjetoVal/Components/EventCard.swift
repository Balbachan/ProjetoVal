//
//  EventCard.swift
//  ProjetoVal
//
//  Created by Laura C. Balbachan dos Santos on 12/11/23.
//

import SwiftUI

struct EventCard: View, Identifiable {
    let id = UUID()
    @State var isSaved: Bool = false
    @State var cardAbout: String
    @State var cardAddress: String
    @State var cardAudience: String
    @State var cardDate: String
    @State var cardImage: String
    @State var cardLanguage: String
    @State var cardClose: String
    @State var cardOpen: String
    @State var cardTitle: String
    @State var savedItems: [EventCard] = []
    
    var body: some View {
        NavigationLink {
            EventsDetailsView(isSaved: $isSaved, savedItems: $savedItems, descAbout: cardAbout, descAddress: cardAddress, descAudience: cardAudience, descDate: cardDate, descImage: cardImage, descLanguage: cardLanguage, descClose: cardClose, descOpen: cardOpen, descTitle: cardTitle)
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
                    Button("") {
                        if !isSaved {
                            // Se o evento não estiver salvo, adicione-o à lista de salvos
                            let event = EventCard(isSaved: true, cardAbout: cardAbout, cardAddress: cardAddress, cardAudience: cardAudience, cardDate: cardDate, cardImage: cardImage, cardLanguage: cardLanguage, cardClose: cardClose, cardOpen: cardOpen, cardTitle: cardTitle)
                            savedItems.append(event)
                            isSaved.toggle()
                        } else {
                            // Se já estiver salvo, remove da lista de salvos
                            if let index = savedItems.firstIndex(where: { $0.cardTitle == cardTitle }) {
                                savedItems.remove(at: index)
                                isSaved.toggle()
                            }
                        }
                    }
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
    }
}

#Preview {
    EventCard(isSaved: true, cardAbout: "Legal", cardAddress: "Legal", cardAudience: "Legal", cardDate: "Legal", cardImage: "book", cardLanguage: "Legal", cardClose: "Legal", cardOpen: "Legal", cardTitle: "Legal", savedItems: [])
}
