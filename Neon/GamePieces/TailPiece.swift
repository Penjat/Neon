//
//  TailPiece.swift
//  Neon
//
//  Created by Spencer Symington on 2019-02-08.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import SpriteKit

class TailPiece: SKSpriteNode {
  convenience init(position: CGPoint) {
    
    self.init(texture: nil, color: UIColor.red, size: CGSize(width: 0.0, height: 0.0))
    let starLabel = SKLabelNode(text: "★")
    self.position = position
    addChild(starLabel)
  }
  
  override init(texture: SKTexture?, color: UIColor, size: CGSize) {
    super.init(texture: texture, color: color, size: size)
  }
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  func fadeOut(){
    
    let sequence = [SKAction.fadeOut(withDuration: 1.0),SKAction.removeFromParent()]
    self.run(SKAction.sequence(sequence))
  }
}
