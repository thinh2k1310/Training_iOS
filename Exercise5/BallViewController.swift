//
//  BallViewController.swift
//  Exercise5
//
//  Created by Truong Thinh on 27/04/2022.
//

import UIKit

class BallViewController: UIViewController {

    @IBOutlet weak var ballView: BallView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func changeColer(_ sender: UIButton) {
        if sender.tag == 0 {
            ballView.ballColor = .red
        }else {
            ballView.ballColor = .blue
        }
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        if touch.view == ballView {
            ballView.center = touch.location(in: view)
            ballView.ballColor = .cyan
        }else {
            ballView.ballColor = .purple
        }
    }
    
    
}
