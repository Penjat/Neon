

import SpriteKit

class SpinningPiece : PieceNode{
  
  override func setUp(){
    let rotate = SKAction.repeatForever(SKAction.rotate(byAngle: 0.5, duration: 1.0))
    
    run(rotate)
  }
}
