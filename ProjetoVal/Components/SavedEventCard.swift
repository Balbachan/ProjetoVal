////
////  EventCard.swift
////  ProjetoVal
////
////  Created by Laura C. Balbachan dos Santos on 12/11/23.
////
//
//import SwiftUI
//
//struct SavedEventCard: View {
//    @State var isSaved: Bool = false
//    @State var cardAbout: String
//    @State var cardAddress: String
//    @State var cardAudience: String
//    @State var cardDate: String
//    @State var cardImage: String
//    @State var cardLanguage: String
//    @State var cardClose: String
//    @State var cardOpen: String
//    @State var cardTitle: String
//    
//    
//    var body: some View {
//        NavigationLink {
//            EventsDetailsView(isSaved: $isSaved, savedItems: $, descAbout: cardAbout, descAddress: cardAddress, descAudience: cardAudience, descDate: cardDate, descImage: cardImage, descLanguage: cardLanguage, descClose: cardClose, descOpen: cardOpen, descTitle: cardTitle)
//        } label: {
//            VStack(alignment: .leading, spacing: 0) {
//                Image("\(cardImage)")
//                    .resizable()
//                    .scaledToFill()
//                    .frame(width: 311, height: 210)
//                    .clipShape(UnevenRoundedRectangle(
//                        cornerRadii: .init(
//                            topLeading: 15,
//                            bottomLeading: 0,
//                            bottomTrailing: 0,
//                            topTrailing: 15),
//                        style: .continuous)
//                    )
//                
//                    HStack {
//                        // Texto do Card
//                        VStack(alignment: .leading) {
//                            Text("\(cardTitle)")
//                                .font(.callout)
//                                .fontWeight(.semibold)
//                                .multilineTextAlignment(.leading)
//                            
//                            Text("\(cardDate)")
//                                .font(.subheadline)
//                                .fontWeight(.light)
//                        }
//                        .padding()
//                        Spacer()
//                        
//                        // Botão de Salvar
//                        Button("") {
//                            print("aa")
//                        }
//                        .buttonStyle(SaveButton(isSaved: $isSaved))
//                        .padding()
//                    }
//                .frame(width: 311, height: 64)
//                .background(.projectWhite)
//                .clipShape(UnevenRoundedRectangle(
//                    cornerRadii: .init(
//                        topLeading: 0,
//                        bottomLeading: 15,
//                        bottomTrailing: 15,
//                        topTrailing: 0),
//                    style: .continuous)
//                )
//                
//            }
//        }
//
//        
//    }
//}
//
//#Preview {
//    SavedEventCard(isSaved: true, cardAbout: "Legal", cardAddress: "Legal", cardAudience: "Legal", cardDate: "Legal", cardImage: "book", cardLanguage: "Legal", cardClose: "Legal", cardOpen: "Legal", cardTitle: "Legal")
//}
