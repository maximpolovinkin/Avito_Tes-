//
//  TestModel.swift
//  Avito_Test
//
//  Created by Максим Половинкин on 19.10.2022.
//

import Foundation

struct Data {
    var header: String
    var row: [String]
    
    init(header: String, row: [String]){
        self.header = header
        self.row = row
    }
}
