//
//  UsersMain.swift
//  examenDigipro
//
//  Created by Mac on 03/08/23.
//

import Foundation
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
            
            interactor.presenter = presenter
            
            router.navigation = navigation
            return view
        }
        return UIViewController()
    }
}
