//
//  GameSettingViewController.swift
//  Bubble_pop2
//
//  Created by Samuel Li on 24/4/21.
//

import UIKit

class GameSettingViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var timeSlider: UISlider!
    @IBOutlet weak var timerText: UILabel!
    
    @IBOutlet weak var bubbleSlider: UISlider!
    @IBOutlet weak var bubbleText: UILabel!
    
    override func viewDidLoad() {
       
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToGame" {
            let VC = segue.destination as! GameViewController
            VC.name = nameField.text!
           VC.bubbleSpawn = Int(bubbleSlider.value)
            VC.time = Int(timeSlider.value)
        }
    }
    
    @IBAction func bubbleAdjust(_ sender: UISlider) {
        let value = sender.value
        var game = GameViewController()
        //bubbleText.text = "\(value)"
        game.bubbleSpawn = Int(value)
        bubbleText.text = "\(game.bubbleSpawn)"
    }

   
    



}
