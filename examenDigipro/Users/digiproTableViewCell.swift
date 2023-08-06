//
//  inventoryTableViewCell.swift
//  generalDictionary
//
//  Created by Mac on 09/01/23.
//

import UIKit

class digiproTableViewCell: UITableViewCell {
    
    static let identifier = "digiproTableViewCell"
    
    public var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUIElements()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public convenience init(){
        self.init()
    }
    
    fileprivate func setupUIElements() {
        self.addSubview(nameLabel)
        self.backgroundColor = .white
    }
    
    fileprivate func setupConstraints() {
        NSLayoutConstraint.activate([
            self.nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            self.nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            self.nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            self.nameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            self.nameLabel.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}
