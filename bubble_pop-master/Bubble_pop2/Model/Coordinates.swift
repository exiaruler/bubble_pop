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
    
    
    func randomCorBubbleTest()->Bubble?{
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
        /*
        if checkBubbleOverlap(x: i.xPosition, y: i.yPosition){
            print("overlap")
        }
       */
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
    func checkBubbleOverlap(x:Int,y:Int)->Bool{
        
        if !bubbleStorage.isEmpty  {
        for item in bubbleStorage {
            if sortXY(x: x, y: y, listX: item.xPosition, listY: item.yPosition){
                print("\(x),\(y) and \(item)")
            
                return true
            }
     
        }
        }
        return false
        
    }
    
    func distanceMeasureCheck(input:Int,list:Int)->Bool{
        let sum = input - list
        // check distance between plan spawned and existing is equal or less
        if sum <= 100 && sum >= 0{
     return true
        }
        return false
    }
    func distanceMeasure(input:Int,list:Int)->Int{
        let sum = input - list
        // check distance between plan spawned and existing is equal or less
     return sum
    }

    // sort value from the highest coordinates and lowest to find a similar match
    func sortXY(x:Int,y:Int,listX:Int,listY:Int)->Bool{
        var storage: [Int] = []
        // checks distances to determine bubble spawned position with existing bubbles
            if distanceMeasureCheck(input: x, list: listX) && distanceMeasureCheck(input: x, list: listY){
            return true
         
            }else {
            if distanceMeasureCheck(input: listX, list: x) && distanceMeasureCheck(input: listY, list: x){
                return true
    
            }
            }
        
        return false
    }
    
    func repositionBubbleCoor(x:Int,y:Int)->(Int,Int){
        var a = x + 100
        var b = y + 100
        return (a,b)
    }
    
    func checkBubble(x:Int,y:Int)->Bool{
        for item in bubbleStorage{
            if x == item.xPosition && y == item.yPosition{
                return true
            }
        }
        return false
    }
    
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
        
        if chain.count > 2 {
        chain.removeLast()
            return true
        }
        return false
    }
    
    
 
    
    
}
    /*
    func findBubbleColour(i:Bubble)->String{
        var select = -1
        print(i)
        for item in bubbleStorage {
            select += 1
            if item == i {
                print(item.colour)
                return item.colour
            }
        }
        return ""
    }
    
    */
    

