//
//  Coordinates.swift
//  Bubble_pop2
//
//  Created by Samuel Li on 26/4/21.
//

import Foundation
import UIKit
class Coordinates:UIButton {
    // storage of bubbles that are spawned
    var bubbleStorage : [Bubble] = []
    // bubble pop chain
    var chain : [String] = []

    func addBubble(object:Bubble){
        bubbleStorage.append(object)
    }
    
    
    func randomBubble()->Bubble?{
        var select = -1
        let count = bubbleStorage.count
        var randomBubble = Int.random(in: 0...count)
        randomBubble -= 1
        for item in bubbleStorage {
            select += 1
            if select == randomBubble{
                bubbleStorage.remove(at: select)
                return item
            }
        }
        return nil
    }
   
    
    
    func removeBubbleScoring(i:Bubble)->(Double,String){
        
      
        var select = -1
            chain.append(i.colour)
        for item in bubbleStorage {
            select += 1
            if item == i {
                bubbleStorage.remove(at: select)
                return (item.value,item.colour)
            }
        }
        
        
        
        return (0,"")
    }

    func checkBubbleOverlap(object:Bubble)->Bool{
        
        if !bubbleStorage.isEmpty  {
        for item in bubbleStorage {
            
            if object.frame.intersects(item.frame){
      //          print("\(object) and \(item)")
            
                return true
            }
     
        }
        }
        return false
        
    }
    func getBubbleOverLap(object:Bubble)->Bool{
        
        if !bubbleStorage.isEmpty  {
        for item in bubbleStorage {
            
            if object.frame.intersects(item.frame){
                print("\(object) and \(item)")
            
                return true
            }
     
        }
        }
        return false
        
    }
    
    func repostionUpward(object:Bubble)->Bubble{
        let xRange = object.xPosition
        let yRange = object.yPosition
            let newX = Int.random(in: xRange...290)
             let newY = Int.random(in: yRange...720)
             object.xPosition = newX
             object.yPosition = newY
    return object
    }
    
    // Creates new coordinates using previous bubble coordinates as base
    func repostionDownward(object:Bubble)->Bubble{
        let xRange = object.xPosition
        let yRange = object.yPosition
        let newX = Int.random(in: 10...xRange)
        let newY = Int.random(in: 100...yRange)
             object.xPosition = newX
             object.yPosition = newY
    return object
    }
    
    // check bubble if there a same set of existing coordinates
    func checkBubble(x:Int,y:Int)->Bool{
        for item in bubbleStorage{
            if x == item.xPosition && y == item.yPosition{
                return true
            }
        }
        return false
    }
   
    
   
    
    // checks array to find miss maatch of colour in array for chain
    func checkChainLoop(colour:String)->Bool{
       // loops over array to find mismatch of colour in array
        if chain.count > 2 {
            for item in chain {
                if !colour.contains(item){
                    chain.removeAll()
                    return false
                }
            }
        }
        // 
        if chain.count > 2 {
        chain.removeLast()
            return true
        }
        return false
    }
    
    
 
    
    
}
  
    

