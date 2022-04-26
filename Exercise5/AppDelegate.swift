//
//  AppDelegate.swift
//  Exercise5
//
//  Created by Truong Thinh on 26/04/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let userDefaults = UserDefaults.standard
        
        let loginViewController = LoginViewController()
        if let userName = userDefaults.string(forKey: "username"){
            let homeViewController = HomeViewController()
            homeViewController.username = userName
            let navController = UINavigationController()
            navController.viewControllers = [loginViewController,homeViewController]
            window?.rootViewController = homeViewController
        }else{
            window?.rootViewController = UINavigationController(rootViewController: LoginViewController())
        }
        window?.makeKeyAndVisible()
        return true
                    
    }


}

