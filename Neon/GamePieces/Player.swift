//
//  Player.swift
//  Neon
//
//  Created by Spencer Symington on 2019-02-07.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import SpriteKit



class Player: SKSpriteNode {
  
  var lives = [SKLabelNode]()
  var score = 0
  let scoreLabel = SKLabelNode(text: "0")
  
  var isFlashing = true //signifies has been damaged and shouldn't take more dmg
  
  convenience init(scene: GameScene) {
    self.init(texture: nil, color: UIColor.blue, size: CGSize(width:20,height:20 ) )
    
    let x = -50.0 + scene.frame.width/2
    let y = 60.0 - scene.frame.height/2
    scoreLabel.position = CGPoint(x:x , y:y)
    scoreLabel.fontSize = 50.0
    scene.addChild(scoreLabel)
    
    physicsBody = SKPhysicsBody(rectangleOf: CGSize(width:20,height:20))
    physicsBody?.collisionBitMask = 2
    physicsBody?.contactTestBitMask = 1
    physicsBody?.categoryBitMask = PLAYER_CATAGORY
    physicsBody?.isDynamic = false
    
  }
  
  func addToScore(points:Int){
    score += points
    scoreLabel.text = "\(score)"
  }
  
  
  override init(texture: SKTexture?, color: UIColor, size: CGSize) {
    super.init(texture: texture, color: color, size: size)
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  func addLife(scene:GameScene){
    let life = SKLabelNode(text: "♥︎")
    let offset = CGFloat(40 * lives.count)
    let x = (50.0 - scene.frame.width/2) + offset
    let y = 40.0 - scene.frame.height/2
    life.position = CGPoint(x:x , y:y)
    lives.append(life)
    scene.addChild(life)
  }
  
  func removeLife(){
    let life = lives.removeLast()
    life.removeFromParent()
  }
  func dmgPlayer (){
    //check if isFlashing
    //removes one life and starts player flashing
    
    if isFlashing {
      return
    }
    removeLife()
    startFlashing()
  }
  
  func checkGameOver() -> Bool{
    if lives.count == 0{
      return true
    }
    return false
  }
  func startFlashing(){
    isFlashing = true
    
    let flashAction1 = SKAction.run({self.color = UIColor.white})
    let wait = SKAction.wait(forDuration: 0.1)
    let flashAction2 = SKAction.run({self.color = UIColor.blue})
    let flashLoop =  SKAction.repeat(SKAction.sequence([flashAction1,wait,flashAction2,wait]), count: 10)
    run(flashLoop ,completion: {
      self.isFlashing = false
    })
    
  }
}

