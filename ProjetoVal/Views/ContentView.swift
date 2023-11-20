//
//  ContentView.swift
//  ProjetoVal
//
//  Created by Laura C. Balbachan dos Santos on 08/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "heart")
                .imageScale(.large)
                .foregroundStyle(.projectWhite)
            Text("Eu te amo, momore!")
                .foregroundStyle(.projectWhite)
            
        }
        .padding()
        .background(.darkBlue)
        .clipShape(RoundedRectangle(cornerRadius: 25.0))
    }
}

#Preview {
    ContentView()
}
