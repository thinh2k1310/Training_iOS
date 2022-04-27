//
//  AvatarView.swift
//  Exercise5
//
//  Created by Truong Thinh on 27/04/2022.
//

import UIKit

class AvatarView: UIView {

    @IBOutlet weak var userAvatar: UIImageView!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBAction func didTapAvatarView(_ sender: UIButton) {
        
        print("Avatar view is clicked!")
    }
}
