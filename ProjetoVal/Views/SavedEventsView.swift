//
//  SavedEventsView.swift
//  ProjetoVal
//
//  Created by Laura C. Balbachan dos Santos on 19/11/23.
//

import SwiftUI

struct SavedEventsView: View {
    @State var isSaved: Bool
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Salvos")
        }
    }
}

#Preview {
    SavedEventsView(isSaved: true)
}
