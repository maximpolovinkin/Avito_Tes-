//
//  NetworkingServise.swift
//  Avito_Test
//
//  Created by Максим Половинкин on 19.10.2022.
//


import Foundation


enum NetworkError: Error{
    case invalidURL
    case nilData
    case descriptionError
}

final class NetworkManager {
    
    func dataFetch(status: @escaping(Result<CompanyResponse, NetworkError>) -> Void) {
        
        guard let url = URL(string: "https://run.mocky.io/v3/1d1cb4ec-73db-4762-8c4b-0b8aa3cecd4c") else {
            status(.failure(.invalidURL))
            return
        }
        
        let session: URLSession = {
            let sessionConfig = URLSessionConfiguration.default
            sessionConfig.timeoutIntervalForRequest = 5
            return URLSession(configuration: sessionConfig)
        }()
        
        let task = session.dataTask(with: url) { data, response, error in
            guard let data = data else {
                return status(.failure(.nilData))
            }
            
            let company = try? JSONDecoder().decode(CompanyResponse.self, from: data)
            
            guard let company = company else {
                return status(.failure(.descriptionError))
            }
            
            DispatchQueue.main.async {
                status(.success(company))
            }
        }.resume()
    }
}



