//
//  TabBarViewController.swift
//  Exercise5
//
//  Created by Truong Thinh on 27/04/2022.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: FriendsViewController())
        let vc3 = UINavigationController(rootViewController: MessagesViewController())
        let vc4 = UINavigationController(rootViewController: ProfileViewController())
        
        vc1.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home") , selectedImage: UIImage(named: "home"))
        vc1.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 6, bottom: 6, right: 6)
        vc2.tabBarItem = UITabBarItem(title: "Friend", image: UIImage(named: "friend") , selectedImage: UIImage(named: "friend"))
        vc2.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 6, bottom: 6, right: 6)
        vc3.tabBarItem = UITabBarItem(title: "Message", image: UIImage(named: "message") , selectedImage: UIImage(named: "message"))
        vc3.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 6, bottom: 6, right: 6)
        vc4.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "profile") , selectedImage: UIImage(named: "profile"))
        vc4.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 6, bottom: 6, right: 6)
        
        tabBar.backgroundColor = .lightGray

        
        setViewControllers([vc1,vc2,vc3,vc4], animated: true)
    }
    



}
