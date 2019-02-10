

import SpriteKit

extension GameScene{
  func didBegin(_ contact: SKPhysicsContact) {
    print("contact happened")
    
    //check collision between player and piece
    if contact.bodyA.categoryBitMask == PLAYER_CATAGORY && contact.bodyB.categoryBitMask == PIECE_CATAGORY {
      print("the player hit a piece and should lose a life")
      
      player.dmgPlayer()
      if player.checkGameOver(){
        gameOver()
      }
      
    }else if contact.bodyB.categoryBitMask == PLAYER_CATAGORY && contact.bodyA.categoryBitMask == PIECE_CATAGORY {
      print("the player hit a piece and should lose a life")
      
      player.dmgPlayer()
      if player.checkGameOver(){
        gameOver()
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
      
      if piece.collectType == CollectType.Points {
        //add to score
        player.addToScore(points: piece.points)
      }else{
        //dmg player
        player.dmgPlayer()
        if player.checkGameOver(){
          gameOver()
        }
      }
    }else{
      print("Warning: node in piece category without pieceNode class")
    }
    body.node?.removeFromParent()
    
  }
  
  

}
