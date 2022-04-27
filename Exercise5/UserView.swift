//
//  UserView.swift
//  Exercise5
//
//  Created by Truong Thinh on 26/04/2022.
//

import UIKit

protocol UserViewDelegate : AnyObject {
    func didTapUserView(_ userView : UserView, didSelect index : Int)
}

class UserView: UIView {
    
    weak var delegate : UserViewDelegate?
    
    private let userAvatar : UIImageView = {
        let imageview = UIImageView()
        imageview.image = UIImage(named:"user")
        imageview.contentMode = .scaleAspectFill
        imageview.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        return imageview
    }()
    
    private let userNameLabel : UILabel  = {
        let label = UILabel(frame: CGRect(x: 0, y: 100, width: 100, height: 30))
        label.text = "Username"
        label.textAlignment = .center
        label.backgroundColor = .lightGray
        label.textColor = .blue
        return label
    }()
    
    private let button : UIButton = {
       let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 150))
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return button
    }()
    override init(frame : CGRect){
        super.init(frame: frame)
        
        
        addSubview(userAvatar)
        addSubview(userNameLabel)
        addSubview(button)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    @objc func didTapButton(){
        delegate?.didTapUserView(self, didSelect: 10)
    }
    public func configure(userName : String, userImage : String){
        userNameLabel.text = userName
        userAvatar.image = UIImage(named: userImage)
    }

}
