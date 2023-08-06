//
//  UsersView.swift
//  examenDigipro
//
//  Created by Mac on 03/08/23.
//

import UIKit

class UsersView: UIViewController {
    var presenter: UsersPresenterProtocol?
    private var ui: UsersViewUI?
    
    override func loadView() {
        ui = UsersViewUI()
        self.title = "Registro de Usuarios"
        view = ui
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.requestUserList()
    }
}

extension UsersView: UsersViewProtocol {
    func notifyUserList(userList: [UserDatabase]) {
        ui?.updateElementList(userList)
    }
}
