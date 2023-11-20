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

                    Divider()
                    
                    EventGrid()
                    
                }
                .frame(maxWidth: .infinity) // Para o ScrollView funcionar na tela toda
            }
            .navigationTitle("Activities")
            .searchable(text: $searchTerm)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: SavedEventsView()) {
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
