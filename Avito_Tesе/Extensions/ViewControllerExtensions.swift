//
//  ViewControllerExtensions.swift
//  Avito_Test
//
//  Created by Максим Половинкин on 20.10.2022.
//

import Foundation

extension ViewController {
  
    func loadFromApi() {
        let networkManager = NetworkManager()
        
        networkManager.dataFetch {[weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                self.employee = data.company.employees
                
                DispatchQueue.main.async {
                    self.sort(employee: data.company.employees)
                    self.mainTable.reloadData()
                }
                
                //                DispatchQueue.global().async {
                //                    self.cache.saveToCache(employee: self.employee)
                //                }
                //
                //                self.cache.print()
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func loadFromCache() {
        self.cache.load { [weak self] result in
            guard let self = self else {
                return
            }
            
            switch result {
            case .success(let employee):
                self.employee = employee
                
                DispatchQueue.main.async {
                    self.sort(employee: employee)
                    self.mainTable.reloadData()
                }
            case .failure(let error):
                print(error)
                
            }
        }
    }
}
