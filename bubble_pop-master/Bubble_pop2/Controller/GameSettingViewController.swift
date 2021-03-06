//
//  GameSettingViewController.swift
//  Bubble_pop2
//
//  Created by Samuel Li on 24/4/21.
//

import UIKit

class GameSettingViewController: UIViewController {
    // view components
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var timeSlider: UISlider!
    @IBOutlet weak var timerText: UILabel!
    @IBOutlet weak var bubbleSlider: UISlider!
    @IBOutlet weak var bubbleText: UILabel!
    //variables
    let game = GameViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // self.test()
        // Do any additional setup after loading the view.
    
    }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToGame" {
            let game = segue.destination as! GameViewController
            game.name = nameField.text!
            game.time = Int(timeSlider.value)
            game.bubbleSpawn = Int(bubbleSlider.value)
            

        }
    }
    
    // shows adjustment of how many bubbles
    @IBAction func bubbleAdjust(_ sender: UISlider) {
        let value = sender.value
        let game = GameViewController()
        game.bubbleSpawn = Int(bubbleSlider.value)
        bubbleText.text = "\(game.bubbleSpawn)"
    }
    // shows adjustment of time set 
    @IBAction func timeAdjust(_ sender: UISlider) {
        let test = sender.value
        let game = GameViewController()
        game.time = Int(timeSlider.value)
        timerText.text = "\(game.time)"
    }
   

   
    



}
