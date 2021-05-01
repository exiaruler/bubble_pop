//
//  ScoreBoardViewController.swift
//  Bubble_pop2
//
//  Created by Samuel Li on 29/4/21.
//

import UIKit

class ScoreBoardViewController: UIViewController {
    let game = GameViewController()
    let save = UserDefaults.standard
    var score:[(String,Int)] = []
   
    override func viewDidLoad() {
        super.viewDidLoad()
        save.set(score,forKey: "key")
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func returnMainPage(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    func sortScore(){
        let newEntry = (game.name,game.score)
        if !score.isEmpty {
        for item in score {
            if newEntry.1 > item.1 {
                
            }
        }
        }else {
         //   score.append((newEntry.0,newEntry.1))
            save.set(score,forKey: "key")
            
        }
    }
    

}
