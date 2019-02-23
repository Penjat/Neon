

import SpriteKit

class DiamondPiece : PieceNode{
  
  override func setUp(ratio:Float = 1.0){
    let fadeToGray = SKAction.colorize(with: .purple, colorBlendFactor: 1.0, duration: 0.4)
    
    run(SKAction.sequence([SKAction.wait(forDuration: 1.3),fadeToGray]))
  }
  
  
}
