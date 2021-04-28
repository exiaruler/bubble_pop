//
//  Bubble.swift
//  Bubble_pop2
//
//  Created by Samuel Li on 24/4/21.
//

import UIKit

class Bubble: UIButton {
   
    var value:Double = 0
    var colour:String = ""
    //20
    //50
    //bubble postion
    let xPosition = Int.random(in: 20...300)
    let yPosition = Int.random(in: 50...600)
   
    
    // spawn random colour of bubble
    let randomColor = Int.random(in:0...100)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        bubbleDim()
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bubbleDim(){
        colourSpawn()
        self.frame = CGRect(x: xPosition, y: yPosition, width: 100, height: 100)
        self.layer.cornerRadius = 0.5 * self.bounds.size.width
        
    }
    
  
    func animation() {
        let springAnimation = CASpringAnimation(keyPath: "transform.scale")
        springAnimation.duration = 0.6
        springAnimation.fromValue = 1
        springAnimation.toValue = 0.8
        springAnimation.repeatCount = 1
        springAnimation.initialVelocity = 0.5
        springAnimation.damping = 1
        layer.add(springAnimation, forKey: nil)
    }
    
  
    func flash() {
        
        let flash = CABasicAnimation(keyPath: "opacity")
        flash.duration = 0.2
        flash.fromValue = 1
        flash.toValue = 0.1
        flash.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        flash.autoreverses = true
        flash.repeatCount = 3
        
        layer.add(flash, forKey: nil)
    }
    
    func colourSpawn(){
    switch randomColor {
    case 0...40:
    self.backgroundColor = .red
        self.value = 1
        self.colour = "red"
     
    case 41...70:
        self.value = 2
        self.colour = "pink"
        self.backgroundColor = .systemPink
   
    case 71...85:
        self.backgroundColor = .green
        self.value = 5
        self.colour = "green"
 
    case 86...94:
        self.backgroundColor = .blue
        self.value = 8
        self.colour = "blue"
    
    case 95...100:
        self.backgroundColor = .black
        self.value = 10
        self.colour = "black"
     
    default:
     print("default")
        
    
    
    }

    }
    
    
   

    
}



