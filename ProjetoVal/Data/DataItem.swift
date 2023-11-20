//
//  DataItem.swift
//  ProjetoVal
//
//  Created by Laura C. Balbachan dos Santos on 19/11/23.
//

import Foundation
import SwiftData

@Model
class DataItem: Identifiable {
    var id: String
    var name: String
    
    init(name: String) {
        self.id = UUID().uuidString
        self.name = name
    }
}
