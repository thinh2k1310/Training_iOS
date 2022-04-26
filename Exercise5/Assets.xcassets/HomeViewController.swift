//
//  HomeViewController.swift
//  Exercise5
//
//  Created by Truong Thinh on 26/04/2022.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        view.backgroundColor = .blue
        navigationController?.navigationBar.backgroundColor = .brown
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.isHidden = false
    }
}

