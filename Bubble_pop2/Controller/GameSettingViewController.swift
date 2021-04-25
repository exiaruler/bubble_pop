//
//  GameSettingViewController.swift
//  Bubble_pop2
//
//  Created by Samuel Li on 24/4/21.
//

import UIKit

class GameSettingViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var timerSlider: UISlider!
    
    @IBOutlet weak var timerText: UILabel!
    
    @IBOutlet weak var bubbleSlider: UISlider!
    
    override func viewDidLoad() {
       
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToGame" {
            let VC = segue.destination as! GameViewController
            VC.name = nameField.text!
           VC.bubbleSpawn = Int(bubbleSlider.value)
            VC.time = Int(timerSlider.value)
        }
    }

    



}
