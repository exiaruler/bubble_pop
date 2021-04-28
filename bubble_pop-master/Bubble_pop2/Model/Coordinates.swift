//
//  Coordinates.swift
//  Bubble_pop2
//
//  Created by Samuel Li on 26/4/21.
//

import Foundation
import UIKit
class Coordinates:UIButton {
    var bubbleStorage : [Bubble] = []
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
        if checkBubbleOverlap(x: i.xPosition, y: i.yPosition){
            print("overlap")
        }
       
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
    
    func distanceMeasure(input:Int,list:Int)->Bool{
        let sum = input - list
        if sum <= 30 && sum >= 0{
          
     return true
        }
        return false
    }

    // sort value from the highest coordinates and lowest to find a similar match
    func sortXY(x:Int,y:Int,listX:Int,listY:Int)->Bool{
            if distanceMeasure(input: x, list: listX) || distanceMeasure(input: x, list: listY){
            return true
          //  return (highestX,highestY,lowestX,lowestY)
            }else {
            if distanceMeasure(input: listX, list: x) || distanceMeasure(input: listY, list: x){
                return true
          //  return (highestX,highestY,lowestX,lowestY)
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
        var previousValue:String = ""
       var test = lastItemChain()
        if chain.count > 2 {
  
            if previousValue.isEmpty {
                previousValue = lastItemChain()
            }
            
            if !colour.contains(previousValue){
                chain.removeAll()
                return false
            }
        }
        
        if chain.count > 2 {
        chain.removeLast()
            return true
        }
        return false
    }
    func lastItemChain()->String{
        var select = 0
        for item in chain {
            select += 1
            if select == 2 {
                return item
            }
        }
        return ""
    }
    
    func test(colour:String) {
        let chainSize = chain.count
        
        for item in chain {
            if !colour.contains(item){
                chain.removeAll()
            }
        }
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
    

