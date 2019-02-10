//
//  PieceNode.swift
//  Neon
//
//  Created by Spencer Symington on 2019-02-07.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import SpriteKit

class PieceNode: SKSpriteNode {
  //GamePiece, something the player can circle around
  
  var collectType :CollectType!
  var points :Int!
  
  convenience init(piece: Piece ){
    
    self.init(texture: nil, color: piece.collectType.getColor(), size: CGSize(width: 40.0, height: 40.0))
    points = 50
    collectType = piece.collectType
  }
  
  override init(texture: SKTexture?, color: UIColor, size: CGSize) {
    super.init(texture: texture, color: color, size: size)
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
}
