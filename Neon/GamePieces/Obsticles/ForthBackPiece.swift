

import SpriteKit

class ForthBackPiece : PieceNode{
  
  override func setUp(piece: Piece , scene:GameScene){
    super.setUp(piece: piece, scene: scene)
    let ratio = scene.getRatio()
    //TODO better calculations, +position
    let rightAction = SKAction.moveTo(x: (-16*CGFloat(ratio) + self.size.width/2), duration: 2.0)
    let toCenter = SKAction.moveTo(x: 0, duration: 2.0)
   let leftAction = SKAction.moveTo(x: (16*CGFloat(ratio) - self.size.width/2), duration: 2.0)
    
    run(SKAction.repeatForever(SKAction.sequence([rightAction,toCenter,leftAction,toCenter])))
  }
}
