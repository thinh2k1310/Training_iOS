//
//  HomeViewController.swift
//  Exercise5
//
//  Created by Truong Thinh on 26/04/2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    let ballViewButton : UIButton = {
        let button = UIButton(frame: CGRect(x: 100, y: 500, width: 120, height: 50))
        button.setTitle("Ball View", for: .normal)
        button.backgroundColor = .blue
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userView = UserView(frame: CGRect(x: 50, y: 100, width: 150, height: 200))
        userView.configure(userName: "Quoc Thinh", userImage: "user")
        view.addSubview(userView)
        userView.delegate = self
        
        guard let avatarView = Bundle.main.loadNibNamed("AvatarView", owner: self, options: nil)?[0] as? AvatarView else {
            return
        }
        avatarView.frame = CGRect(x: view.bounds.size.width - 150, y: 100, width: 100, height: 250)
        avatarView.userNameLabel.text = "Thinh123"
        view.addSubview(avatarView)
        
        view.addSubview(ballViewButton)
        ballViewButton.addTarget(self, action: #selector(moveToBallView), for: .touchUpInside)
        
        
    }
    
    @objc func moveToBallView(){
        let ballViewController = BallViewController()
        navigationController?.pushViewController(ballViewController, animated: true)
    }
}
extension HomeViewController : UserViewDelegate {
    func didTapUserView(_ userView: UserView, didSelect index: Int) {
        print("Select user at index \(index)")
    }
}
