//
//  RegisterView.swift
//  examenDigipro
//
//  Created by Mac on 03/08/23.
//

import UIKit

class RegisterView: UIViewController {
    var presenter: RegisterPresenterProtocol?
    private var ui: RegisterViewUI?
    
    override func loadView() {
        ui = RegisterViewUI(
            navigation: self.navigationController ?? UINavigationController(),
            delegate: self
        )
        view = ui
    }
}

extension RegisterView: RegisterViewProtocol {
    func notifyCompleteForm() {
        ui?.clearFields()
    }
}

extension RegisterView: RegisterViewUIDelegate {
    func notifyCreateUser(name: String, secondName: String, thirdName: String, email: String, phone: String) {
       let userModel = UserDatabase(name: name,
                      secondName: secondName,
                      thirdName: thirdName,
                      email: email,
                      phone: phone)
        presenter?.requestCreateUser(model: userModel)
    }
    
    func notifyShowAlert(tittle: String, message: String) {
        presenter?.responseUser(tittle: tittle, message: message)
    }
    
}
