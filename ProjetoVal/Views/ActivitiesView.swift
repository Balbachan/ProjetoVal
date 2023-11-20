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
    @State private var searchTerm = ""
    @State var savedEvents: [EventCard] = []
    
    init() {
        model.getData()
    }
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                VStack(alignment: .leading) {
                    //                    HStack(alignment: .center) {
                    //                        Text("Activities")
                    //                            .bold()
                    //                            .font(.largeTitle)
                    //                            .padding(.horizontal, 20)
                    //
                    //                        Spacer()
                    //
                    //                        NavigationLink(
                    //                            destination: {
                    //                                SavedEventsView(isSaved: true, savedEvents: $savedEvents) },
                    //                            label: {
                    //                                Label("", systemImage: "bookmark")
                    //                                .labelStyle(.iconOnly) }
                    //                        )
                    //
                    //                        .tint(.projectBlack)
                    //                        .padding(.horizontal, 20)
                    //                    }
                    
                    Divider()
                    
                    EventGrid()
                    
                }
                .frame(maxWidth: .infinity) // Para o ScrollView funcionar na tela toda
            }
            .navigationTitle("Activities")
            .searchable(text: $searchTerm)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: SavedEventsView(savedEvents: $savedEvents)) {
                        Image(systemName: "bookmark")
                    }
                    .tint(.projectBlack)
                }
            }
        }
    }
}


#Preview {
    ActivitiesView()
}
