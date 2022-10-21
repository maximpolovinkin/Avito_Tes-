//
//  TestModel.swift
//  Avito_Test
//
//  Created by Максим Половинкин on 19.10.2022.
//

import Foundation

struct SectionModel: Encodable, Decodable {
    var title: String
    var values: [Employee]
    
    init(title: String, values: [Employee]){
        self.title = title
        self.values = values
    }
}
