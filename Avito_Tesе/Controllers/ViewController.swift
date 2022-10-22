//
//  ViewController.swift
//  Avito_Tesе
//
//  Created by Максим Половинкин on 19.10.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let mainTable = UITableView(frame: .zero, style: .insetGrouped)
   
    
    let id = "cell"
    var employee = [Employee]()
   // var sortedEmployee: (keys: [String], values: [[Employee]])? = nil
    var sections = [SectionModel]()
   // var networkingService = NetworkingService()
    let cache = EmployeeCacheWorking()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if NetworkMonitor.shared.isConnected {
            print("connected")
            loadFromApi()
        } else  {
            print("not connected")
            loadFromCache()
        }
        
        setupViews()
       
    }
    
    func setupViews() {
        mainTable.frame = CGRect(x: 10, y: 10, width: 300, height: 600)
        mainTable.delegate = self
        mainTable.dataSource = self
        mainTable.register(MainTableViewCell.self, forCellReuseIdentifier: id)
        
        view.addSubview(mainTable)
        
        mainTable.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainTable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainTable.topAnchor.constraint(equalTo: view.topAnchor),
            mainTable.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
    }
    
    func sort(employee: [Employee]){
        var dict = [String: [Employee]]()
        var sortedKeys = [String]()
   
        
        for employee in employee {
            if dict[String(employee.name.prefix(1))] == nil {
                dict[String(employee.name.prefix(1))] = [employee]
            } else {
                dict[String(employee.name.prefix(1))]?.append(employee)
                
            }
        }
        
        sortedKeys = dict.keys.sorted()
        
        for i in 0..<sortedKeys.count{
            let section = SectionModel(title: sortedKeys[i], values: [])
            sections.append(section)
            // for j in dict[sortedKeys[i]]! {
            sections[i].values =  dict[sortedKeys[i]]!
            //}
        }
        
        
        //sortedValues = dict.values.sorted(by: {$0[0].name < $1[0].name})
            
       
        //return (sortedKeys, sortedValues)
    }
}

