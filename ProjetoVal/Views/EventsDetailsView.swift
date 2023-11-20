//
//  EventsDetailsView.swift
//  ProjetoVal
//
//  Created by Laura C. Balbachan dos Santos on 19/11/23.
//

import SwiftUI

struct EventsDetailsView: View {
    @Binding var isSaved: Bool
    @Binding var savedItems: [EventCard]
    @State var descAbout: String
    @State var descAddress: String
    @State var descAudience: String
    @State var descDate: String
    @State var descImage: String
    @State var descLanguage: String
    @State var descClose: String
    @State var descOpen: String
    @State var descTitle: String
    
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
                    
                    Button("") {
                        if !isSaved {
                            // Se o evento não estiver salvo, adicione-o à lista de salvos
                            let event = EventCard(isSaved: true, cardAbout: descAbout, cardAddress: descAddress, cardAudience: descAudience, cardDate: descDate, cardImage: descImage, cardLanguage: descLanguage, cardClose: descClose, cardOpen: descOpen, cardTitle: descTitle)
                            savedItems.append(event)
                            isSaved.toggle()
                        } else {
                            // Se já estiver salvo, remova-o da lista de salvos (opcional)
                            if let index = savedItems.firstIndex(where: { $0.cardTitle == descTitle }) {
                                savedItems.remove(at: index)
                                isSaved.toggle()
                            }
                        }
                    }
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
