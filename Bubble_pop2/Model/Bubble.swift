//
//  Bubble.swift
//  Bubble_pop2
//
//  Created by Samuel Li on 24/4/21.
//

import UIKit

class Bubble: UIButton {
    
    struct BubbleValues {
        var colour:String
        var value = 0
    }
    
    let red = BubbleValues(colour:"red",value:1)
    let pink = BubbleValues(colour: "pink",value: 2)
    let  green = BubbleValues(colour: "green",value: 5)
    let blue = BubbleValues(colour: "blue",value:8)
    let black = BubbleValues(colour: "black", value: 10)
    let empty = BubbleValues(colour: "", value: 0)
    
    let xPosition = Int.random(in: 20...360)
    let yPosition = Int.random(in: 50...800)
   
    
    // spawn random colour of bubble
    let randomColor = Int.random(in:1...100)
    
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
    
    func colourSpawn()->BubbleValues{
    switch randomColor {
    case 1...40:
    self.backgroundColor = .red
        return red
    case 41...70:
        self.backgroundColor = .systemPink
     return pink
    case 71...85:
        self.backgroundColor = .green
      return green
    case 86...94:
        self.backgroundColor = .blue
     return blue
    case 95...100:
        self.backgroundColor = .black
        return black
    default:
     print("default")
        
    
    
    }
  return empty
    }
    
    func getBubble()->BubbleValues{
        switch randomColor {
        case 1...40:
         //   print("red")
        return red
        case 41...70:
         //   print("pink")
           return pink
        case 71...85:
        //    print("green")
         return green
        case 86...94:
          //  print("blue")
            return blue
        case 95...100:
          //  print("black")
            return black
        default:
         print("default")
            
        
        
        }
        return empty
    }

    
}



