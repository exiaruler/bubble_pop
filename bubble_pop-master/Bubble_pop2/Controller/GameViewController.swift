//
//  GameViewController.swift
//  Bubble_pop2
//
//  Created by Samuel Li on 24/4/21.
//

import UIKit
import AVFoundation

class GameViewController: UIViewController {
    // labels
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var countDownLabel: UILabel!
    
    // variables
    
    var coordinates = Coordinates()
    // audio
    var bruh = AVAudioPlayer()
    var nobu = AVAudioPlayer()
    // game variables
    var score = 0;
    var name: String?
    var time = 60
    var countDownStart = 4
    var bubbleSpawn = 15
    var bubbleStarter = Timer()
    var timer = Timer()
    var starter = Timer()
    var bubbleGoneTimer = 2
    let randomBubbleSpawnNum = Int.random(in: 5...15)
    

    override func viewDidLoad() {
       
        super.viewDidLoad()
        // components
        timeLabel.text = String(time)
        scoreLabel.text = String(score)
        // sound effects
        let bruhSound = Bundle.main.path(forResource: "movie_1", ofType: "mp3")
        let nobuSound = Bundle.main.path(forResource: "noob", ofType: "mp3")
        do {
            bruh = try AVAudioPlayer(contentsOf:URL(fileURLWithPath: bruhSound!))
            nobu = try AVAudioPlayer(contentsOf:URL(fileURLWithPath: nobuSound!))
            
        } catch{
            error
        }
        // game count down before it starts
            starter = Timer.scheduledTimer(withTimeInterval: 1,  repeats:true){
            starter in
            self.startingCount()
        }
        // game session after count down complete
    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4), execute: {
        self.gameStartUp()
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){
            timer in
            self.countDown()
            self.bubbleSpawning()
            self.despawnBubble()
        }
    })
        // Do any additional setup after loading the view.
    }

    
    // time countdown during game session
    @objc func countDown(){
    
        time -= 1
        timeLabel.text = String(time)
        
        if time == 0 {
            timer.invalidate()
            coordinates.gameEnd()
            // redirect to score board 
            performSegue(withIdentifier: "gameToScore", sender: self)
        }
    }
    
    // count down for start of the game
    @objc func startingCount(){
        countDownStart -= 1
        countDownLabel.text = String(countDownStart)
        if countDownStart == 0 {
            starter.invalidate()
           countDownLabel.isHidden = !countDownLabel.isHidden
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
    // creates bubble
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
    
    // pressing bubble
    @IBAction func bubblePressed(_ sender: UIButton) {
        sender.removeFromSuperview()
        // get bubble point value and add to score
        let value = coordinates.removeBubbleScoring(i: sender as! Bubble)
        // check bubble chain
        if coordinates.checkChainLoop(colour: value.1) {
            // if there a chain multiply point value
            nobu.play()
            let add = value.0 * 1.5
            score += Int(add.rounded())
            scoreLabel.textColor = UIColor.yellow
            scoreLabel.text = String (score)
           
            // if no current chain, normal point value
        }else {
            bruh.play()
            score += Int(value.0)
            scoreLabel.textColor = UIColor.black
        scoreLabel.text = String (score)
            
           
        }
       
    }
    
    // adds bubbles on screen before game starts
    @objc func gameStartUp(){
        while coordinates.bubbleStorage.count != bubbleSpawn{
            bubbleGenerate()
        }
        
        
    }
    
    // spawn random number of bubbles
    @objc func bubbleSpawning(){
        for _ in 1...randomBubbleSpawnNum {
            bubbleGenerate()
        }
        if time == 0 {
            coordinates.gameEnd()
        }
    }
   
    
    // select a random replacement of bubble coordinates
    func randomPosition(i:Bubble){
        let random = Int.random(in:0...100)
       
        switch random{
        // upward range
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
            // downward range
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

