//
//  UsersRouter.swift
//  examenDigipro
//
//  Created by Mac on 04/08/23.
//

import UIKit

class UsersRouter{
    var navigation: UINavigationController?
    
}

extension UsersRouter: UsersRouterProtocol{
    func navigateShowAlert(tittle: String, message: String) {
        let alertController = UIAlertController(title: tittle, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(okAction)
        navigation?.present(alertController, animated: true, completion: nil)
    }
}
