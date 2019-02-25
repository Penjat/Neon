

import SpriteKit
import CoreData

class PieceNode: SKSpriteNode {
  //GamePiece, something the player can circle around
  
  var collectType :CollectType!
  var points :Int!
  
  
  
  convenience init(piece: Piece , scene: GameScene){
    let pieceCollectType = CollectType.getCollectType(colorAsInt: Int(piece.color))
    
    self.init(texture: nil, color: pieceCollectType.getColor(), size: CGSize(width: 40.0, height: 40.0))
    
    points = 10
    collectType = pieceCollectType
    setUp(piece: piece, scene: scene)
  }
  func setUp(piece: Piece , scene:GameScene){
    //do nothing for base class
    
    let x = CGFloat(piece.x)
    let y = CGFloat(piece.y)
    let width = CGFloat(piece.width)
    let height = CGFloat(piece.height)
    let piecePosition = scene.getPositionForScreen(position: CGPoint(x:x,y:y) )
    position = piecePosition
    size = scene.getSizeForScreen(size: CGSize(width:width,height:height))
    
    physicsBody = SKPhysicsBody(rectangleOf: scene.getSizeForScreen(size: CGSize(width:width,height:height)))
    physicsBody?.collisionBitMask = 0
    physicsBody?.contactTestBitMask = 1
    physicsBody?.categoryBitMask = PIECE_CATAGORY
    physicsBody?.isDynamic = true
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
