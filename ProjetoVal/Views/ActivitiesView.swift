//
//  ActivitiesView.swift
//  ProjetoVal
//
//  Created by Laura C. Balbachan dos Santos on 19/11/23.
//

import SwiftUI
import CoreData
import Firebase

struct ActivitiesView: View {
    @ObservedObject var model = ViewModel()
    @State private var searchTerm = ""
    @State var savedEvents: [EventCard] = []
    
    
    //Coisas do CoreData
    @Environment(\.managedObjectContext) var context //Contexto da minha DataController
    
    @ObservedObject var myDataController: MyDataController //Aqui vou receber aquela minha primeira instância, para acessar minhas funções
    
    @FetchRequest(sortDescriptors: []) var coreData: FetchedResults<Saved> //Aqui eu recebo no vetor coreData todos os itens que o usuário tem em seu dispositivo da entidade Saved da minha Model
    
    init(context: NSManagedObjectContext) {
        self.myDataController = MyDataController(context: context)
        model.getData()
    }
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                VStack(alignment: .leading) {

                    Divider()
                    
                    EventGrid(context: context)
                    
                }
                .frame(maxWidth: .infinity) // Para o ScrollView funcionar na tela toda
            }
            .navigationTitle("Activities")
//            .searchable(text: $searchTerm)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: SavedEventsView(context: context)) {
                        Image(systemName: "bookmark")
                    }
                    .tint(.projectBlack)
                }
            }
        }
    }
}


#Preview {
    ActivitiesView(context: DataController().container.viewContext) //Aqui para o Preview não crashar eu preciso passar um contexto por parâmetro, então eu instancio outra DataController() e chamo container dela
}
