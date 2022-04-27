//
//  BallView.swift
//  Exercise5
//
//  Created by Truong Thinh on 27/04/2022.
//

import UIKit

@IBDesignable
class BallView: UIView {
    @IBInspectable
    var ballColor : UIColor = .green {
        didSet{
            setNeedsDisplay()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(ballColor.cgColor)
        context?.fillEllipse(in: bounds)
    }

}
