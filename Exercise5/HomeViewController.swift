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
        
        title = "Home"
        welcomLabel.text = "Welcome \(username ?? "")"
// MARK: - navigation bar
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.backgroundColor = .brown
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.prefersLargeTitles = false
// MARK: - Basic custom
//        let searchBarButton = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(search))
//        let bookmarkBarButton = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(bookmark))
//        let settingButton = UIBarButtonItem(image: UIImage(named: "icon-setting"), style: .plain, target: self, action: #selector(setting))
//        navigationItem.rightBarButtonItems = [searchBarButton,bookmarkBarButton]
// MARK: - Advanced custom
        let searchButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        searchButton.addTarget(self, action: #selector(search), for: .touchUpInside)
        searchButton.setImage(UIImage(named: "icon-search"), for: .normal)
        searchButton.imageEdgeInsets = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
        
        let settingButton = UIButton(frame: CGRect(x: 50, y: 0, width: 50, height: 50))
        settingButton.addTarget(self, action: #selector(setting), for: .touchUpInside)
        settingButton.setImage(UIImage(named: "icon-setting"), for: .normal)
        settingButton.imageEdgeInsets = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
        
        let rightCustomView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        rightCustomView.bounds = rightCustomView.bounds.offsetBy(dx: -20, dy: 0)
        rightCustomView.addSubview(searchButton)
        rightCustomView.addSubview(settingButton)
        
        let rightBarButton = UIBarButtonItem(customView: rightCustomView)
        navigationItem.rightBarButtonItem = rightBarButton
// MARK: - Left bar button - Back button
        let backButton = UIButton(frame: CGRect(x:0, y: 0, width: 100, height: 50))
        backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
        backButton.setImage(UIImage(named: "icon-back"), for: .normal)
        backButton.imageEdgeInsets = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 62)
        
        let leftCustomView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        leftCustomView.bounds = leftCustomView.bounds.offsetBy(dx: 20 , dy: 0)
        leftCustomView.addSubview(backButton)
    
        
        navigationItem.hidesBackButton = true
        let leftBarButton = UIBarButtonItem(customView: leftCustomView)
        navigationItem.leftBarButtonItem = leftBarButton
        
        
        
    }
    
    @IBAction func tappedBackButton( _ sender : Any){
        UserDefaults.standard.set(nil, forKey: "username")
        navigationController?.popViewController(animated: true)
    }
    @objc func search(){
        print("Tapped search")
    }
    @objc func back(){
        UserDefaults.standard.set(nil, forKey: "username")
        navigationController?.popViewController(animated: true)
    }
    @objc func setting(){
        print("Tapped setting")
    }

}
