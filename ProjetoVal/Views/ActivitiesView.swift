//
//  ActivitiesView.swift
//  ProjetoVal
//
//  Created by Laura C. Balbachan dos Santos on 19/11/23.
//

import SwiftUI
import Firebase

struct ActivitiesView: View {
    @ObservedObject var model = ViewModel()
    
    init() {
        model.getData()
    }
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                VStack(alignment: .leading) {
                    HStack(alignment: .center) {
                        Text("Activities")
                            .bold()
                            .font(.largeTitle)
                            .padding(.horizontal, 20)
                        
                        Spacer()
                        
                        NavigationLink(
                            destination: {
                                SavedEventsView(isSaved: true) },
                            label: {
                                Label("", systemImage: "bookmark")
                                .labelStyle(.iconOnly) }
                        )
                        .tint(.black)
                        .padding(.horizontal, 20)
                    }
                    Divider()
                    
                    ForEach(model.event) { item in
                        Grid {
                            if item.type == "entertainment" {
                                VStack(alignment: .leading) {
                                    Text("Entertainment")
                                        .bold()
                                    ScrollView(.horizontal){
                                        GridRow {
                                            EventCard(cardAbout: item.about, cardAddress: item.address, cardAudience: item.audience, cardDate: item.date, cardImage: item.image, cardLanguage: item.language, cardClose: item.time_close, cardOpen: item.time_open, cardTitle: item.title)
                                        }
                                    }
                                }
                            }
                            
                            if item.type == "sports" {
                                VStack(alignment: .leading) {
                                    Text("Sports")
                                        .bold()
                                    ScrollView(.horizontal) {
                                        GridRow {
                                            EventCard(cardAbout: item.about, cardAddress: item.address, cardAudience: item.audience, cardDate: item.date, cardImage: item.image, cardLanguage: item.language, cardClose: item.time_close, cardOpen: item.time_open, cardTitle: item.title)
                                        }
                                    }
                                }
                            }
                            
                            if item.type == "various" {
                                VStack(alignment: .leading) {
                                    Text("Various")
                                        .bold()
                                    ScrollView(.horizontal) {
                                        GridRow {
                                            EventCard(cardAbout: item.about, cardAddress: item.address, cardAudience: item.audience, cardDate: item.date, cardImage: item.image, cardLanguage: item.language, cardClose: item.time_close, cardOpen: item.time_open, cardTitle: item.title)
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
                }
                .frame(maxWidth: .infinity) // Para o ScrollView funcionar na tela toda
            }
        }
    }
}


#Preview {
    ActivitiesView()
}
