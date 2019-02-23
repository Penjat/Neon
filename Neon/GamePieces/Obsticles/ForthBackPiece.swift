

import SpriteKit

class ForthBackPiece : PieceNode{
  
  override func setUp(ratio:Float){
    
    //TODO better calculations, +position
    let rightAction = SKAction.moveTo(x: (-16*CGFloat(ratio) + self.size.width/2), duration: 2.0)
    let toCenter = SKAction.moveTo(x: 0, duration: 2.0)
   let leftAction = SKAction.moveTo(x: (16*CGFloat(ratio) - self.size.width/2), duration: 2.0)
    
    run(SKAction.repeatForever(SKAction.sequence([rightAction,toCenter,leftAction,toCenter])))
  }
}
