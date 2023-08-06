//
//  UsersMain.swift
//  examenDigipro
//
//  Created by Mac on 03/08/23.
//

import UIKit

open class UsersMain{
    public static func createModule(navigation: UINavigationController) -> UIViewController {
        let viewController: UsersView? = UsersView()
        if let view = viewController {
            let presenter = UsersPresenter()
            let router = UsersRouter()
            let interactor = UsersInteractor()
            
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
