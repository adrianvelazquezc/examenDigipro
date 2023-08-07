//
//  HomePresenter.swift
//  examenDigipro
//
//  Created by Mac on 03/08/23.
//

import Foundation

class HomePresenter {
    var router: HomeRouterProtocol?
}

extension HomePresenter: HomePresenterProtocol {
    func requestShowAlert() {
        if UserDefaults.standard.bool(forKey: "instructionsShowed") == false {
            router?.navigateShowAlert()
        }
    }
    
}
