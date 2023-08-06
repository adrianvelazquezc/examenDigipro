//
//  UsersProtocols.swift
//  examenDigipro
//
//  Created by Mac on 03/08/23.
//

import Foundation

protocol UsersViewProtocol: AnyObject {
    func notifyUserList(userList: [UserDatabase])
}

protocol UsersInteractorProtocol: AnyObject {
    func fetchUserList()
}

protocol UsersPresenterProtocol: AnyObject {
    func requestUserList()
    func responseUserList(userList: [UserDatabase])
    func responseError(tittle: String, error: String)
}

protocol UsersRouterProtocol: AnyObject {
    func navigateShowAlert(tittle: String, message: String)
}
