//
//  HomeViewController.swift
//  Exercise5
//
//  Created by Truong Thinh on 26/04/2022.
//

import UIKit

class ContactDetailView: UIViewController {
    
    private let detailLabel : UILabel = {
        let label =  UILabel()
        label.text = "Detail"
        label.textAlignment =  .center
        label.font = .systemFont(ofSize: 20, weight : .regular)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Detail"
        view.addSubview(detailLabel)

    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        detailLabel.frame = CGRect(x: (view.bounds.width-200)/2, y: (view.bounds.height-50)/2, width: 200, height: 50)
    }
    public func configure(with detail : String){
        detailLabel.text = detail
    }
    
}

