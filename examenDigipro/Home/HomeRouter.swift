//
//  HomeRouter.swift
//  examenDigipro
//
//  Created by Mac on 03/08/23.
//

import UIKit

class HomeRouter{
    var navigation: UINavigationController?
    
}

extension HomeRouter: HomeRouterProtocol{
    func navigateShowAlert() {
        let bottomAlertVC = DigiproInstructionsView()
        bottomAlertVC.modalPresentationStyle = .overFullScreen
        navigation?.present(bottomAlertVC, animated: true, completion: nil)
    }
}
