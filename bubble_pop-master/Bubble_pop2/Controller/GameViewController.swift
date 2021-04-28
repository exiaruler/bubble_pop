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
    
    var coordinates = Coordinates()
    // game variables
    var score = 0;
    var name = "test"
    var time = 60
    var bubbleSpawn = 2
    var timer = Timer()
    var bubbleGone = 3
    var chain:[Int] = []
    let bubbleSpawnNum = Int.random(in: 1...5)
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        timeLabel.text = String(time)
        scoreLabel.text = String(score)
        self.gameStartUp()
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){
            timer in
            self.countDown()
          
            self.bubbleGenerate()
        
            self.despawnBubble()
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
    //removes bubble off screen
    @objc func despawnBubble(){
        let randomRemoval = Int.random(in: 1...5)
        // count down
       bubbleGone -= 1
        // if hit 0
        if bubbleGone == 0 {
            // get random and removes it
            for i in 1...randomRemoval {
                let target = coordinates.randomCorBubbleTest()
            target?.removeFromSuperview()
            }
            bubbleGone = 3
        }
    }
    
    @objc func bubbleGenerate(){
       let bubble = Bubble()
      print(  coordinates.bubbleStorage.count)
    // check if can spawn bubble in that position
        if !coordinates.checkBubble(x: bubble.xPosition, y: bubble.yPosition) && coordinates.bubbleStorage.count <= 15{
            bubble.animation()
            // add current bubble to array
            coordinates.addBubble(object: bubble)
            bubble.addTarget(self, action: #selector(bubblePressed), for: .touchUpInside)
            self.view.addSubview(bubble)
          //  print(bubble.frame)
            
            
        }
      //  print(coordinates.coordinates)
       
        
    }
    func bubbleSpawnPro(){
        let bubble = Bubble()
        bubble.animation()
        // add current bubble to array
        coordinates.addBubble(object: bubble)
        bubble.addTarget(self, action: #selector(bubblePressed), for: .touchUpInside)
        self.view.addSubview(bubble)

    }
    
    
    @IBAction func bubblePressed(_ sender: UIButton) {
        sender.removeFromSuperview()
        // get bubble point value and add to score
        let value = coordinates.removeBubbleScoring(i: sender as! Bubble)
        if coordinates.chain.count > 2 && coordinates.checkChainLoop(colour: value.1){
            score += Int(value.0)
        scoreLabel.text = String (score)
        }else {
            let add = value.0.rounded()
            print(add)
            score += Int(add)
            scoreLabel.text = String (score)
        }
        print(sender)
    }
    
    @objc func gameStartUp(){
        for i in 1...bubbleSpawn {
            bubbleGenerate()
        }
    }
   
    

    

}
