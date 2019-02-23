//
//  PieceNode.swift
//  Neon
//
//  Created by Spencer Symington on 2019-02-07.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import SpriteKit
import CoreData

class PieceNode: SKSpriteNode {
  //GamePiece, something the player can circle around
  
  var collectType :CollectType!
  var points :Int!
  
  convenience init(piece: Piece ){
    let pieceCollectType = CollectType.getCollectType(colorAsInt: Int(piece.color))
    
    self.init(texture: nil, color: pieceCollectType.getColor(), size: CGSize(width: 40.0, height: 40.0))
    points = 50
    collectType = pieceCollectType
    
  }
  func setUp(ratio:Float = 1.0){
    
  }
  
  override init(texture: SKTexture?, color: UIColor, size: CGSize) {
    super.init(texture: texture, color: color, size: size)
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  func clear(){
    physicsBody = nil
    let fadeOut = SKAction.fadeOut(withDuration: 1.0)
    let grow = SKAction.scale(by: 1.8, duration: 1.0)
    let clearAction = SKAction.group([fadeOut,grow])
    let remove = SKAction.removeFromParent()
    
    run(SKAction.sequence([clearAction,remove]))
  }
  
}
