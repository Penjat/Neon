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
      
      player.dmgPlayer()
      if player.checkGameOver(){
        //Do gameover stuff
      }
      
    }else if contact.bodyB.categoryBitMask == PLAYER_CATAGORY && contact.bodyA.categoryBitMask == PIECE_CATAGORY {
      print("the player hit a piece and should lose a life")
      
      player.dmgPlayer()
      if player.checkGameOver(){
        //Do gameover stuff
      }
    }
    
    //check collision between piece and tail
    if contact.bodyA.categoryBitMask == TAIL_CATAGORY && contact.bodyB.categoryBitMask == PIECE_CATAGORY {
      
      
      clearPiece(body:contact.bodyB)
      
    }else if contact.bodyB.categoryBitMask == TAIL_CATAGORY && contact.bodyA.categoryBitMask == PIECE_CATAGORY {
      
      
      clearPiece(body:contact.bodyA)
    }
  }
  func clearPiece(body:SKPhysicsBody){
    //TODO keep track for points multiplier
    if let piece = body.node as? PieceNode{
      
      if piece.shouldGet {
        //add to score
        player.addToScore(points: piece.points)
      }else{
        //dmg player
        player.dmgPlayer()
      }
    }else{
      print("Warning: node in piece category without pieceNode class")
    }
    body.node?.removeFromParent()
    
  }
  
  

}
