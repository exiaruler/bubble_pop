//
//  GameViewController.swift
//  Bubble_pop2
//
//  Created by Samuel Li on 24/4/21.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    // game variables
    var score = 0;
    var name = "test"
    var time = 60
    var bubbleSpawn = 15

    var timer = Timer()
    //bubble spawn coordinates
    var bubbleCoor = [Double]()
   // let bubble = Bubble()
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        timeLabel.text = String(time)
        scoreLabel.text = String(score)
        self.gameStartUp()
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){
            timer in
            self.countDown()
            self.bubbleGenerate()
        }
        // Do any additional setup after loading the view.
    }
    
    @objc func countDown(){
        time -= 1
        timeLabel.text = String(time)
        
        if time == 0 {
            timer.invalidate()
            /*
            let vc = storyboard?.instantiateViewController(identifier: "HighScoreViewController") as! ScoreboardViewController
            self.navigationController?.pushViewController(vc, animated: true)
            vc.navigationItem.setHidesBackButton(true, animated: true)
 */
        }
    }
    @objc func despawnBubble(){
        var bubbleGone = 5
        let bubble = Bubble()
       bubbleGone -= 1
        if bubbleGone == 0 {
            bubble.removeFromSuperview()
        }
    }
    
    @objc func bubbleGenerate(){
       let bubble = Bubble()
        bubble.animation()
        bubble.addTarget(self, action: #selector(bubblePressed), for: .touchUpInside)
        self.view.addSubview(bubble)
       // print(bubble.frame)
       // print("\(bubble.xPosition)  \(bubble.yPosition) ")
      //  print()
        print(bubble.colourSpawn().self)
       
        
    }
    
    
    @IBAction func bubblePressed(_ sender: UIButton) {
        let bubble = Bubble()
        sender.removeFromSuperview()
        
        
        
    }
    
    
    @objc func gameStartUp(){
        for i in 1...bubbleSpawn {
            bubbleGenerate()
        }
    }
    // collects the scoring
    func scoring() {
        
        
    }

    

    

}
