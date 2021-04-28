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
        if !bubbleStorage.isEmpty {
        for item in bubbleStorage {
            let i = sortXY(x: x, y: y, listX: item.xPosition, listY: item.yPosition)
            //   print("\(x) and \(y)")
             //  print("\(item.xPosition) and \(item.yPosition)")
            let a = (i.0,i.1)
            let b = (i.2,i.3)
          //  print("\(a) and \(b)")
            if a > b{
                print(item.colour)
            
                return true
            }
     
        }
        }
        return false
        
    }
    
    func distanceMeasure(input:Int,list:Int)->Bool{
        let sum = input - list
        if sum <= 60 && sum >= 0{
          
     return true
        }
        return false
    }

    // sort value from the highest coordinates and lowest to find a similar match
    func sortXY(x:Int,y:Int,listX:Int,listY:Int)->(Int,Int,Int,Int){
        var highestX = 0
        var highestY = 0
        
        var lowestX = 0
        var lowestY = 0
        if x > listX && y > listY {
            if distanceMeasure(input: x, list: listX) && distanceMeasure(input: x, list: listY){
            highestX = x
            highestY = y
            lowestX = listX
            lowestY = listY
            return (highestX,highestY,lowestX,lowestY)
            }
        } else{
            if listX > x && listY > y{
            if distanceMeasure(input: listX, list: x) && distanceMeasure(input: listY, list: x){
            highestX = listX
            highestY = listY
            lowestX = x
            lowestY = y
            return (highestX,highestY,lowestX,lowestY)
            }
        }
        }
    return (0,0,0,0)
     
        
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
        for item in chain {
            if previousValue.isEmpty {
                previousValue = item
            }
            if item.contains(previousValue){
                previousValue = item
            }
            if !item.contains(colour){
                return true
            }
        }
        chain.removeAll()
        return false
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
    
}
