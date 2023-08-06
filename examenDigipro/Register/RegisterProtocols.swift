//
//  RegisterProtocols.swift
//  examenDigipro
//
//  Created by Mac on 03/08/23.
//

import Foundation

protocol RegisterViewProtocol: AnyObject {
    func notifyCompleteForm()
}

protocol RegisterInteractorProtocol: AnyObject {
    func postNewUser(model: UserDatabase)
}

protocol RegisterPresenterProtocol: AnyObject {
    func requestCreateUser(model: UserDatabase)
    func responseUser(tittle: String, message: String)
}

protocol RegisterRouterProtocol: AnyObject {
    func navigateShowAlert(tittle: String, message: String)
}
