//
//  EmployeeCacheWorking.swift
//  Avito_Test
//
//  Created by Максим Половинкин on 22.10.2022.
//

import Foundation

enum CacheError: Error {
    case error
}

final class EmployeeCacheWorking {
    
    enum CacheWorkKeys {
        static let lastSaveTime = "lastSaveTime"
        static let time: Double = 3600
        static let data = "data"
    }
    
    let userDefaults = UserDefaults.standard
    
    func isTimeIsUp() -> Bool{
        let currentTime = NSDate().timeIntervalSince1970
        let lastLoad = userDefaults.double(forKey: CacheWorkKeys.lastSaveTime)
        
        return !(currentTime - lastLoad > CacheWorkKeys.time)
    }
    
    func saveToCache(employee: [Employee]?){
        guard let data = employee else { return }
        guard let encodedData = try? JSONEncoder().encode(data) else { return }
        DispatchQueue.global().async {
            let time = NSDate().timeIntervalSince1970
            self.userDefaults.set(time, forKey: CacheWorkKeys.lastSaveTime)
            self.userDefaults.set(encodedData, forKey: CacheWorkKeys.data)
        }
    }
    
    func print(){
        if let data = userDefaults.object(forKey: CacheWorkKeys.data) as? Data,
           let decodedData = try? JSONDecoder().decode([Employee].self, from: data) {
            Swift.print(decodedData)
            
        }
    }
    
    func load(completion: @escaping (Result<[Employee], CacheError>) -> Void) {
        DispatchQueue.main.async {
            let result = self.loadFromCache()
            DispatchQueue.main.async {
                completion(result)
            }
        }
    }
    
   private func loadFromCache() -> Result<[Employee], CacheError>{
        
        guard isTimeIsUp() else {
            //Можно сделать модалку с ошибкой
            clearCache()
            return .failure(.error)
        }
        
        guard let data = userDefaults.object(forKey: CacheWorkKeys.data) as? Data else {
            return .failure(.error)
        }
        
        guard let decodedData = try? JSONDecoder().decode([Employee].self, from: data) else {
            return .failure(.error)
        }
        
        return .success(decodedData)
        
    }
    
    
    
    func clearCache(){
        userDefaults.removeObject(forKey: CacheWorkKeys.data)
    }
    
}



