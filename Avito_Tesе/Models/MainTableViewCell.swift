//
//  MainTableViewCell.swift
//  Avito_Test
//
//  Created by Максим Половинкин on 20.10.2022.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    
    var nameLabel = UILabel()
    var numberLabel = UILabel()
    var skillsLabel = UILabel()
    
    var labelsStack: UIStackView = {
        var labelsStack = UIStackView()
        labelsStack.axis = .vertical
        labelsStack.spacing = 16
        
        return labelsStack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setViews()
        setStackConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setStackConstraints() {
        labelsStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelsStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            labelsStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            labelsStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            labelsStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
    
    func setViews() {
        contentView.addSubview(labelsStack)
        labelsStack.addArrangedSubview(nameLabel)
        labelsStack.addArrangedSubview(numberLabel)
        labelsStack.addArrangedSubview(skillsLabel)
        
        nameLabel.font = .systemFont(ofSize: 20)
    }
    
}
