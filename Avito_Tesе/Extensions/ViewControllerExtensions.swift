//
//  ViewControllerExtensions.swift
//  Avito_Test
//
//  Created by Максим Половинкин on 20.10.2022.
//

import Foundation
import UIKit

extension ViewController {
    
    func loadFromApi() {
        let networkManager = NetworkManager()
        
        networkManager.dataFetch {[weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                self.employee = data.company.employees
                
                DispatchQueue.main.async {
                    self.cache.saveToCache(employee: self.employee)
                    self.sort(employee: data.company.employees)
                    self.mainTable.reloadData()
                }
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
                
                let alert = UIAlertController(title: "Упс! Возникла ошибка", message: "Проверьте соединение и перезапустите приложение.", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ок", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
                print(error)
                
            }
        }
    }
}
