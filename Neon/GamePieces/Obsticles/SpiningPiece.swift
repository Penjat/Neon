

import SpriteKit

class SpinningPiece : PieceNode{
  
  

  override func setUp(piece: Piece , scene:GameScene){
    super.setUp(piece: piece, scene: scene)
    let rotate = SKAction.repeatForever(SKAction.rotate(byAngle: 0.5, duration: 1.0))

    run(rotate)
  }
}
