//
//  UsersPresenter.swift
//  examenDigipro
//
//  Created by Mac on 03/08/23.
//

import Foundation

class UsersPresenter {
    var interactor: UsersInteractorProtocol?
    var view: UsersViewProtocol?
    var router: UsersRouterProtocol?
}

extension UsersPresenter: UsersPresenterProtocol {
    func responseError(tittle: String, error: String) {
        router?.navigateShowAlert(tittle: tittle, message: error)
    }
    
    func requestUserList() {
        interactor?.fetchUserList()
    }
    
    func responseUserList(userList: [UserDatabase]) {
        view?.notifyUserList(userList: userList)
    }
    
    
}
