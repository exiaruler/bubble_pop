//
//  ScoreBoardViewController.swift
//  Bubble_pop2
//
//  Created by Samuel Li on 29/4/21.
//

import UIKit

class ScoreBoardViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func returnMainPage(_ sender: UIButton) {
        
        self.navigationController?.popToRootViewController(animated: true)
    }

}
