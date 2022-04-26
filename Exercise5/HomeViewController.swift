//
//  HomeViewController.swift
//  Exercise5
//
//  Created by Truong Thinh on 26/04/2022.
//

import UIKit

class HomeViewController: UIViewController {
    var username : String?
    @IBOutlet weak var welcomLabel : UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Home"
        navigationController?.navigationBar.backgroundColor = .brown
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.isHidden = false
        welcomLabel.text = "Welcome \(username ?? "")"
    }
    
    @IBAction func tappedBackButton( _ sender : Any){
        UserDefaults.standard.set(nil, forKey: "username")
        navigationController?.popToRootViewController(animated: true)
    }

}
