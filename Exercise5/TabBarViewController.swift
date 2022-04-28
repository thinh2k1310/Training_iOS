//
//  TabBarViewController.swift
//  Exercise5
//
//  Created by Truong Thinh on 28/04/2022.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let vc1 = UINavigationController(rootViewController: ContactsViewController())
        let vc2 = GardenViewController()
        
        vc1.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 0)
        vc2.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        
        setViewControllers([vc1,vc2], animated: true)
    }
    

}
