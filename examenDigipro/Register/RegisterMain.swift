//
//  RegisterMain.swift
//  examenDigipro
//
//  Created by Mac on 03/08/23.
//

import UIKit

open class RegisterMain{
    public static func createModule(navigation: UINavigationController) -> UIViewController {
        let viewController: RegisterView? = RegisterView()
        if let view = viewController {
            let presenter = RegisterPresenter()
            let router = RegisterRouter()
            let interactor = RegisterInteractor()
            
            view.presenter = presenter
            
            presenter.view = view
            presenter.interactor = interactor
            presenter.router = router
            
            router.navigation = navigation
            
            interactor.presenter = presenter
            return view
        }
        return UIViewController()
    }
}
