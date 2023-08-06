//
//  RegisterRouter.swift
//  examenDigipro
//
//  Created by Mac on 03/08/23.
//

import UIKit

class RegisterRouter{
    var navigation: UINavigationController?
}

extension RegisterRouter: RegisterRouterProtocol{
    func navigateShowAlert(tittle: String, message: String) {
        let alertController = UIAlertController(title: tittle, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(okAction)
        navigation?.present(alertController, animated: true, completion: nil)
    }
}
