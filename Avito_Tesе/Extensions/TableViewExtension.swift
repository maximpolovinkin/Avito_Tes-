//
//  TableViewExtension.swift
//  Avito_Test
//
//  Created by Максим Половинкин on 19.10.2022.
//

import Foundation
import UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sections[section].values.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mainTable.dequeueReusableCell(withIdentifier: id, for: indexPath) as! MainTableViewCell
        
      
            cell.nameLabel.text = sections[indexPath.section].values[indexPath.row].name
            cell.numberLabel.text = "Phone number:  \(sections[indexPath.section].values[indexPath.row].phoneNumber)"
            cell.skillsLabel.text = "Skills:  \(sections[indexPath.section].values[indexPath.row].skills.joined(separator: ", "))"
  
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
      
        sections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        sections[section].title
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
}
