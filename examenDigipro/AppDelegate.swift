//
//  AppDelegate.swift
//  examenDigipro
//
//  Created by Mac on 03/08/23.
//

import UIKit
import FirebaseCore
import FirebaseFirestore

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        let db = Firestore.firestore()
        
        let navigation = UINavigationController()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
        
        let vc = HomeMain.createModule(navigation: navigation)
        navigation.pushViewController(vc, animated: true)
        return true
    }
    
}

