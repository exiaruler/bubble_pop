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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "ScoreBoardViewController" ){
            // show main menu
            let vc = storyboard?.instantiateViewController(identifier: "ScoreBoardViewController") as! ViewController
            self.navigationController?.pushViewController(vc, animated: true)
            vc.navigationItem.setHidesBackButton(true, animated: true)
            
        }
    }

}
