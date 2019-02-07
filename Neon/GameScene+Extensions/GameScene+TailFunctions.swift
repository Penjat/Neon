//
//  GameScene+TailFunctions.swift
//  Neon
//
//  Created by Spencer Symington on 2019-02-07.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import SpriteKit

extension GameScene{
  
  
  func createTail(){
    lastNode = SKSpriteNode(color: UIColor.red, size: CGSize(width: 20, height: 20))
    
    let relPos = CGPoint(x:player.position.x,y:player.position.y - mainNode.position.y)
    lastNode?.position = relPos
    mainNode.addChild(lastNode!)
    tailArray.append(lastNode!)
    
    
    if tailArray.count < 4{
      return
    }
    var a1 = tailArray[0].position
    let b1 = relPos
    let b2 = tailArray[tailArray.count - 2].position
    for i in 1 ..< tailArray.count-3{
      let a2 = tailArray[i].position
      let intersectPoint = getIntersectionOfLines(line1: (a: a1, b: a2), line2: (a: b1, b: b2))
      if intersectPoint != nil{
        
        let spot = SKSpriteNode(color: UIColor.green, size: CGSize(width: 20, height: 20))
        spot.position = intersectPoint!
        mainNode.addChild(spot)
        let subArray = tailArray[i ..< tailArray.count-1]
        tailArray = [SKSpriteNode]() + tailArray[0...i]
        let mutaPath = CGMutablePath()
        
        var firstPoint = true
        for node in subArray{
          if firstPoint {
            mutaPath.move(to: node.position)
            firstPoint = false
          }else{
            
          }
          mutaPath.addLine(to: node.position)
        }
        let polygon = SKShapeNode()
        polygon.path = mutaPath.copy()
        //polygon.fillColor = UIColor.green
        polygon.strokeColor = UIColor.blue
        polygon.physicsBody = SKPhysicsBody(polygonFrom: mutaPath.copy()!)
        polygon.physicsBody?.categoryBitMask = TAIL_CATAGORY
        polygon.physicsBody?.collisionBitMask = 0
        polygon.physicsBody?.contactTestBitMask = 1
        
        let wait = SKAction.wait(forDuration: 0.5)
        let removeSlef = SKAction.removeFromParent()
        let actions = [wait,removeSlef]
        polygon.run(SKAction.sequence(actions))
        
        mainNode.addChild(polygon)
        print("muta path = \(subArray.count)")
        print("the lines intersect")
        return
      }
      a1 = a2
    }
  }
  
  
  func getIntersectionOfLines(line1: (a: CGPoint, b: CGPoint), line2: (a: CGPoint, b: CGPoint)) -> CGPoint? {
    
    let distance = (line1.b.x - line1.a.x) * (line2.b.y - line2.a.y) - (line1.b.y - line1.a.y) * (line2.b.x - line2.a.x)
    if distance == 0 {
      //print("error, parallel lines")
      return nil
    }
    
    let u = ((line2.a.x - line1.a.x) * (line2.b.y - line2.a.y) - (line2.a.y - line1.a.y) * (line2.b.x - line2.a.x)) / distance
    let v = ((line2.a.x - line1.a.x) * (line1.b.y - line1.a.y) - (line2.a.y - line1.a.y) * (line1.b.x - line1.a.x)) / distance
    
    if (u < 0.0 || u > 1.0) {
      //print("error, intersection not inside line1")
      return nil
    }
    if (v < 0.0 || v > 1.0) {
      //print("error, intersection not inside line2")
      return nil
    }
    
    return CGPoint(x: line1.a.x + u * (line1.b.x - line1.a.x), y: line1.a.y + u * (line1.b.y - line1.a.y))
  }
  
}
