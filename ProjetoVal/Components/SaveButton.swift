//
//  SaveButton.swift
//  ProjetoVal
//
//  Created by Laura C. Balbachan dos Santos on 19/11/23.
//

import SwiftUI

struct SaveButton: ButtonStyle {
    @Binding var isSaved: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        let buttonLabel = Image(systemName: isSaved ? "bookmark.fill" : "bookmark")
            .foregroundStyle(.darkOrange)
            .padding(8)
            .clipShape(Circle())
        
        return buttonLabel
            .background(
                Circle()
                    .fill(.superLightOrange)
            )
            .scaleEffect(configuration.isPressed ? 0.80 : 1.0)
            .animation(.easeInOut(duration: 0.2))
            .onTapGesture {
                isSaved.toggle()
            }
    }
}

#Preview {
    Button("aaa") {
        print("aa")
    }
    .buttonStyle(SaveButton(isSaved: .constant(true)))
}
