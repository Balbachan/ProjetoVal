//
//  EventsDetailsView.swift
//  ProjetoVal
//
//  Created by Laura C. Balbachan dos Santos on 19/11/23.
//

import SwiftUI

struct EventsDetailsView: View {
    @Binding var isSaved: Bool
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
                Image("\(descImage)")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 393, height: 262)
                
                HStack {
                    Text("\(descTitle)")
                        .font(.title)
                        .bold()
                    
                    Spacer()
                    
                    Button("") {
                        print("aa")
                    }
                    .buttonStyle(SaveButton(isSaved: $isSaved, isOrange: true))
                }
                
                HStack {
                    VStack(alignment: .leading, spacing: 10) {
                        Image(systemName: "mappin")
                            .padding(5)
                            .background(.superLightOrange)
                            .clipShape(Circle())
                        
                        Image(systemName: "calendar")
                            .padding(5)
                            .background(.superLightOrange)
                            .clipShape(Circle())
                        
                        Image(systemName: "clock")
                            .padding(5)
                            .background(.superLightOrange)
                            .clipShape(Circle())
                        
                        Image(systemName: "t.bubble")
                            .padding(5)
                            .background(.superLightOrange)
                            .clipShape(Circle())
                        
                        Image(systemName: "person")
                            .padding(5)
                            .background(.superLightOrange)
                            .clipShape(Circle())
                    }
                    
                    VStack(alignment: .leading, spacing: 18) {
                        Text("\(descAddress)")
                            .font(.callout)
                        
                        Text("\(descDate)")
                            .font(.callout)
                        
                        Text("\(descOpen) + \(descClose)")
                            .font(.callout)
                        
                        Text("\(descLanguage)")
                            .font(.callout)
                        
                        Text("\(descAudience)")
                            .font(.callout)
                    }
                    
                }
                
                Text("About")
                    .font(.title3)
                    .bold()
                Text("\(descAbout)")
                
            }
        }
    }
}


#Preview {
    EventsDetailsView(isSaved: .constant(true), descAbout: "Lorem ipsum dolor sit amet consectetur. Tortor tristique est ullamcorper penatibus nulla. Euismod suspendisse ut nisl in ut interdum. Non quis erat convallis a montes auctor proin. Dui et netus in pretium.", descAddress: "Endereço Maneiro", descAudience: "General Public", descDate: "10/01/2024", descImage: "fashionshow", descLanguage: "Portuguese", descClose: "10 PM", descOpen: "10 AM", descTitle: "Super Fashion Show")
}
