//
//  UsersViewUI.swift
//  examenDigipro
//
//  Created by Mac on 03/08/23.
//

import UIKit

class UsersViewUI: UIView{
    var originalElementList: [UserDatabase] = []
    lazy var elementList: [UserDatabase] = originalElementList
    
    private lazy var searchBar: Digipro_TextField = {
        let textField = Digipro_TextField(placeholderText: "Ingresa el usuario a buscar")
        textField.addTarget(self, action: #selector(searchInfo), for: .editingChanged)
        textField.returnKeyType = .search
        textField.delegate = self
        return textField
    }()
    
    public lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(digiproTableViewCell.self, forCellReuseIdentifier: digiproTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setUI()
        setConstraints()
    }
    
    func setUI(){
        self.backgroundColor = .white
        self.addSubview(searchBar)
        self.addSubview(tableView)
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            searchBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            searchBar.heightAnchor.constraint(equalToConstant: 40),
            
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
    @objc func dissmisKeyboard(){
        self.endEditing(true)
    }
    
    @objc func searchInfo(_ textField: UITextField) {
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(searchInfoWithDelay), object: nil)
        self.perform(#selector(searchInfoWithDelay), with: nil, afterDelay: 0.5)
    }
    
    
    @objc func searchInfoWithDelay() {
        getFilterString(filter: searchBar.text ?? "")
    }
    
    private func getFilterString(filter: String) {
        if filter.isEmpty {
            self.elementList = self.originalElementList
        } else {
            self.elementList = self.originalElementList.filter({ $0.name?.localizedCaseInsensitiveContains(filter) ?? false })
        }
        self.tableView.reloadData()
    }
    
    func updateElementList(_ elements: [UserDatabase]) {
        self.originalElementList = elements
        self.elementList = elements
        self.tableView.reloadData()
    }
}

extension UsersViewUI: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        dissmisKeyboard()
        return false
    }
    
}
extension UsersViewUI: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        elementList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "digiproTableViewCell", for: indexPath) as? digiproTableViewCell {
            cell.titleLabel.text = elementList[indexPath.row].name
            return cell
        }
        return UITableViewCell()
    }
    
    
}
