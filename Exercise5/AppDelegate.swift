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
        window?.backgroundColor = .white
        let tabBarVC = TabBarViewController()
        window?.rootViewController = tabBarVC
        window?.makeKeyAndVisible()
        return true
                    
    }


}

