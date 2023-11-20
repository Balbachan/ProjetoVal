//
//  SavedEventsView.swift
//  ProjetoVal
//
//  Created by Laura C. Balbachan dos Santos on 19/11/23.
//

import SwiftUI

struct SavedEventsView: View {
    @Binding var savedEvents: [EventCard]
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 20) {
                ForEach(savedEvents) { item in
                    
                }
            }
            .padding()
        }
        .navigationTitle("Saved")
    }
}


