//
//  RegisterPresenter.swift
//  examenDigipro
//
//  Created by Mac on 03/08/23.
//

import Foundation

class RegisterPresenter {
    var interactor: RegisterInteractorProtocol?
    weak var view: RegisterViewProtocol?
    var router: RegisterRouterProtocol?
}

extension RegisterPresenter: RegisterPresenterProtocol {
    func requestCreateUser(model: UserDatabase) {
        interactor?.postNewUser(model: model)
    }
    
    func responseUser(tittle: String, message: String) {
        router?.navigateShowAlert(tittle: tittle, message: message)
        if tittle == "Bienvenido" {
            view?.notifyCompleteForm()
        }
    }
    
}
