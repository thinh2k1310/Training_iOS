//
//  ContactTableViewCell.swift
//  Exercise5
//
//  Created by Truong Thinh on 28/04/2022.
//

import UIKit
protocol ContactTableViewCellDelegate : AnyObject{
    func makeCall(_ contactTableViewCell : ContactTableViewCell)
    func addToFavourite(_ contactTableViewCell : ContactTableViewCell)
}

class ContactTableViewCell: UITableViewCell {
    
    @IBOutlet weak var avatarImageView : UIImageView!
    @IBOutlet weak var nameLabel : UILabel!
    @IBOutlet weak var subTitleLabel : UILabel!
    @IBOutlet weak var messageButton : UIButton!
    
    weak var delegate : ContactTableViewCellDelegate?
    
    private let callButton : UIButton = {
       let button = UIButton()
        button.setImage(UIImage(named: "phone"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        return button
    }()
    
    private let favouriteButton : UIButton = {
       let button = UIButton()
        button.setImage(UIImage(named: "heart"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        avatarImageView.layer.cornerRadius = avatarImageView.frame.height / 2
        avatarImageView.clipsToBounds = true
        addSubview(callButton)
        addSubview(favouriteButton)
        callButton.addTarget(self, action: #selector(didTapCall), for: .touchUpInside)
        favouriteButton.addTarget(self, action: #selector(didTapFavourite), for: .touchUpInside)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        callButton.frame = CGRect(x: 300, y: 0, width: 50, height: 50)
        favouriteButton.frame = CGRect(x: 350, y: 0, width: 50, height: 50)
        messageButton.imageEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    
    func updateTableViewCell(avatar : String, contactName : String = "", subtitle : String = ""){
        avatarImageView.image = UIImage(named: avatar)
        nameLabel.text = contactName
        subTitleLabel.text = subtitle
    }
    @objc func didTapCall(){
        delegate?.makeCall(self)
    }
    @objc func didTapFavourite(){
        delegate?.addToFavourite(self)
    }
}
