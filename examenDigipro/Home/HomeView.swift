//
//  HomeView.swift
//  examenDigipro
//
//  Created by Mac on 03/08/23.
//

import UIKit

class HomeView: UIViewController {
    var presenter: HomePresenterProtocol?
    private var ui: HomeViewUI?
    
    let tabBar = UITabBarController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        
        let firstVC = RegisterMain.createModule(navigation: self.navigationController ?? UINavigationController())
        let secondVC = UsersMain.createModule(navigation: self.navigationController ?? UINavigationController())
        
        if let storeImage = UIImage(named: "users") {
            firstVC.tabBarItem = UITabBarItem(title: "Usuarios", image: storeImage, tag: 0)
        }
        if let profileImage = UIImage(named: "form") {
            secondVC.tabBarItem = UITabBarItem(title: "Nuevo Registro", image: profileImage, tag: 1)
        }
        
        tabBar.tabBar.tintColor = .black
        tabBar.tabBar.unselectedItemTintColor = .lightGray
        tabBar.setViewControllers([firstVC, secondVC], animated: true)
        
        
        addChild(tabBar)
        self.view.addSubview(tabBar.view)
        tabBar.didMove(toParent: self)
        
        UITabBar.appearance().barTintColor = UIColor.white
        
        ui = HomeViewUI(tabBarBorders: self.tabBar)
        
        presenter?.requestShowAlert()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .darkContent
    }
    
}
