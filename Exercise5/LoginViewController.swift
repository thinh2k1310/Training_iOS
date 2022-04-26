//
//  LoginViewController.swift
//  Exercise5
//
//  Created by Truong Thinh on 26/04/2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField : UITextField!
    @IBOutlet weak var passwordTextField : UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Login"
        
        passwordTextField.isSecureTextEntry = true
    }
    override func viewWillAppear(_ animated: Bool) {
        usernameTextField.text = ""
        passwordTextField.text = ""
        navigationController?.navigationBar.isHidden = true
    }
    
    
    @IBAction func tapLoginButton(_ sender : Any){
        if let username = usernameTextField.text, username != "",
          let password = passwordTextField.text, password != ""{
            UserDefaults.standard.set(username, forKey: "username")
            
            let homeViewController = HomeViewController()
            homeViewController.username = username
            navigationController?.pushViewController(homeViewController, animated: true)
        }
    }


    
}
