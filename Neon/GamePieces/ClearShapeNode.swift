//
//  File.swift
//  Neon
//
//  Created by Spencer Symington on 2019-02-16.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import SpriteKit

class ClearShapeNode : SKShapeNode{
  var pieceNodes = [PieceNode]()
  
  func setUp(player:Player){
    let wait = SKAction.wait(forDuration: 0.2)
    let removeSlef = SKAction.removeFromParent()
    let addUp = SKAction.run({
      self.addUpPoints(player: player)
    })
    let actions = [wait,addUp,SKAction.wait(forDuration: 1.0),SKAction.removeFromParent()]
    run(SKAction.sequence(actions))
  }
  func add(node:PieceNode){
    pieceNodes.append(node)
    
  }
  func addUpPoints(player:Player){
    print("adding up points \(pieceNodes.count)")
    physicsBody = nil
    var points = 0
    
    var x :CGFloat = 0.0
    var y :CGFloat = 0
    
    
    for piece in pieceNodes{
      points += piece.points
      x += piece.position.x
      y += piece.position.y
    }
    if pieceNodes.count == 0{
      return
    }
    x = x / CGFloat(pieceNodes.count)
    y = y / CGFloat(pieceNodes.count)
    
    let pointsWithMulti = pieceNodes.count*points
    player.addToScore(points: points)
    let pointsLabel = SKLabelNode(text: "\(points)x\(pieceNodes.count)")
    
    pointsLabel.fontColor = UIColor.white
    pointsLabel.fontSize = 50.0
    pointsLabel.position = CGPoint(x: x, y: y)
    let fadeOutandUp = SKAction.group([SKAction.fadeOut(withDuration: 1.0),SKAction.move(by: CGVector(dx: 0, dy: 50), duration: 1.0)])
    pointsLabel.run(fadeOutandUp)
    addChild(pointsLabel)
    
  }
  
}
