//
//  GameViewController.swift
//  Bubble_pop2
//
//  Created by Samuel Li on 24/4/21.
//

import UIKit

class GameViewController: UIViewController {
    // labels
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var countDownLabel: UILabel!
    
    var coordinates = Coordinates()
    // game variables
    var score = 0;
    var name: String?
    var time = 60
    var countDownStart = 4
    var bubbleSpawn = 15
    var bubbleStarter = Timer()
    var timer = Timer()
    var stater = Timer()
    var bubbleGoneTimer = 2
    let randomBubbleSpawnNum = Int.random(in: 5...15)
    

    override func viewDidLoad() {
        print(bubbleSpawn)
        super.viewDidLoad()
        timeLabel.text = String(time)
        scoreLabel.text = String(score)
         gameStartUp()
       
        
       
        stater = Timer.scheduledTimer(withTimeInterval: 1, repeats: false){
            starting in
            self.startingCount()
          
           
        }
      
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){
            timer in
            //self.startingCount()
            self.countDown()
            self.bubbleSpawning()
            self.despawnBubble()
        }
        // Do any additional setup after loading the view.
    }
    
    // time countdown during game session
    @objc func countDown(){
        time -= 1
        timeLabel.text = String(time)
        
        if time == 0 {
            timer.invalidate()
            let vc = storyboard?.instantiateViewController(identifier: "ScoreBoardViewController") as! ScoreBoardViewController
            self.navigationController?.pushViewController(vc, animated: true)
            vc.navigationItem.setHidesBackButton(true, animated: true)
        }
    }
    
    @objc func startingCount(){
   
        countDownStart -= 1
        countDownLabel.text = String(countDownStart)
        if countDownStart == 0 {
            countDownLabel.isHidden = !countDownLabel.isHidden
            stater.invalidate()
        }
    }
    
    //removes bubble off screen
    @objc func despawnBubble(){
        let randomRemoval = Int.random(in: 1...5)
        // count down
       bubbleGoneTimer -= 1
        // if hit 0
        if bubbleGoneTimer == 0 {
            // get random and removes it
            for _ in 1...randomRemoval {
                let target = coordinates.randomBubble()
                target?.bubbleDisapear()
            target?.removeFromSuperview()
            }
            bubbleGoneTimer = 3
        }
    }
    
    @objc func bubbleGenerate(){
        let bubble = Bubble()
    // check if can spawn bubble in that position
        if !coordinates.checkBubble(x: bubble.xPosition, y: bubble.yPosition) &&
            coordinates.bubbleStorage.count <= 15  && !coordinates.checkBubbleOverlap(object: bubble){
          
            bubble.animation()
            // add current bubble to array
            coordinates.addBubble(object: bubble)
            bubble.addTarget(self, action: #selector(bubblePressed), for: .touchUpInside)
            self.view.addSubview(bubble)
        }else {
             randomPosition(i: bubble)
        }
      
       
        
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
        // check bubble chain
        if coordinates.checkChainLoop(colour: value.1) {
            // if there a chain multiply point value
            let add = value.0 * 1.5
            print(add.rounded())
            score += Int(add.rounded())
            scoreLabel.text = String (score)
            // if no current chain, normal point value
        }else {
            score += Int(value.0)
        scoreLabel.text = String (score)
        }
        print(sender)
    }
    
    @objc func gameStartUp(){
        while coordinates.bubbleStorage.count != bubbleSpawn{
            bubbleGenerate()
        }
        
        
    }
    
    
    @objc func bubbleSpawning(){
        for i in 1...randomBubbleSpawnNum {
            bubbleGenerate()
        }
    }
    // backup for starter
    func spawnRow(){
        var y = 110
        while coordinates.bubbleStorage.count != 15{
            let spawn = Int.random(in:2...4)
            
            for _ in 1...spawn{
                let bubble = Bubble()
                let x = Int.random(in: 10...290)
                let target = bubble
            target.xPosition = x
            target.yPosition = y
           
        
            if !coordinates.checkBubbleOverlap(object: target){
            target.animation()
            coordinates.addBubble(object: target)
            target.addTarget(self, action: #selector(bubblePressed), for: .touchUpInside)
            self.view.addSubview(target)
            }else{
                let newX = Int.random(in: 10...target.xPosition)
                target.xPosition = newX
                if !coordinates.checkBubbleOverlap(object: target) {
                    target.animation()
                    coordinates.addBubble(object: target)
                    target.addTarget(self, action: #selector(bubblePressed), for: .touchUpInside)
                    self.view.addSubview(target)
                }
            }
        }
            y += 100
        }
    }

    
    func randomPosition(i:Bubble){
        let random = Int.random(in:0...100)
       
        switch random{
        case 0...50:
            let bubble = coordinates.repostionUpward(object: i)
              while !coordinates.checkBubbleOverlap(object: bubble){
                  bubble.animation()
                  // add current bubble to array
                  coordinates.addBubble(object: bubble)
                  bubble.addTarget(self, action: #selector(bubblePressed), for: .touchUpInside)
                  self.view.addSubview(bubble)
              }
                
        case 51...100:
                let bubble = coordinates.repostionDownward(object:i)
                while !coordinates.checkBubbleOverlap(object: bubble){
                    bubble.animation()
                    // add current bubble to array
                    coordinates.addBubble(object: bubble)
                    bubble.addTarget(self, action: #selector(bubblePressed), for: .touchUpInside)
                    self.view.addSubview(bubble)
                }
       
        default:
            print("default")
        }
        
    }
  
    
    
    
   
    

    

}

