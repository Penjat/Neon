//
//  GameScene+Collisions.swift
//  Neon
//
//  Created by Spencer Symington on 2019-02-07.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import SpriteKit

extension GameScene{
  func didBegin(_ contact: SKPhysicsContact) {
    print("contact happened")
    
    //check collision between player and piece
    if contact.bodyA.categoryBitMask == PLAYER_CATAGORY && contact.bodyB.categoryBitMask == PIECE_CATAGORY {
      print("the player hit a piece and should lose a life")
      
    }else if contact.bodyB.categoryBitMask == PLAYER_CATAGORY && contact.bodyA.categoryBitMask == PIECE_CATAGORY {
      print("the player hit a piece and should lose a life")
    }
    
    //check collision between piece and tail
    if contact.bodyA.categoryBitMask == TAIL_CATAGORY && contact.bodyB.categoryBitMask == PIECE_CATAGORY {
      print("should clear piece")
      contact.bodyB.node?.removeFromParent()
      
    }else if contact.bodyB.categoryBitMask == TAIL_CATAGORY && contact.bodyA.categoryBitMask == PIECE_CATAGORY {
      print("should clear piece")
      contact.bodyA.node?.removeFromParent()
    }
  }
  
  

}
