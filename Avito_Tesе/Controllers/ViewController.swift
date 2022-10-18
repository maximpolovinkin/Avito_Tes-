//
//  ViewController.swift
//  Avito_Tesе
//
//  Created by Максим Половинкин on 19.10.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let mainTable = UITableView(frame: .zero, style: .insetGrouped)
    let data = [
        Data(header: "Россия", row: ["Москва", "Владимир", "Унеча"]),
        Data(header: "Россия", row: ["Москва", "Владимир", "Унеча"]),
    ]
    
    let id = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        mainTable.frame = CGRect(x: 10, y: 10, width: 300, height: 600)
        mainTable.delegate = self
        mainTable.dataSource = self
        mainTable.register(UITableViewCell.self, forCellReuseIdentifier: id)
        
        view.addSubview(mainTable)
        
        mainTable.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainTable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainTable.topAnchor.constraint(equalTo: view.topAnchor),
            mainTable.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
    }
    
}

