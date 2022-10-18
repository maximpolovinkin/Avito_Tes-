//
//  NetworkingServise.swift
//  Avito_Test
//
//  Created by Максим Половинкин on 19.10.2022.
//


import Foundation


//"https://run.mocky.io/v3/1d1cb4ec-73db-4762-8c4b-0b8aa3cecd4c"

final class Network {
    public func getData() {
        guard let url = URL(string: "https://run.mocky.io/v3/1d1cb4ec-73db-4762-8c4b-0b8aa3cecd4c") else { return }
        
        DispatchQueue.global().async {
            let task = URLSession.shared.dataTask(with: url){ data, responce, error in
                guard let data = data, error == nil else { return }
                
                do {
                    let responce = try JSONDecoder().decode(Company.self, from: data)
                }
                catch {
                    print(error)
                }
            }
        }
    }
}
