

import SpriteKit
import GameplayKit

class GameScene: SKScene , SKPhysicsContactDelegate , MenuDelegate {
 
  
  
  
  
  
  var isPlaying = false
  
  let mainNode = SKNode()
  let path = UIBezierPath()
  var player :Player!
  var pieceFactory :PieceFactory!
  
  var tailArray = [TailPiece]()
  var pieceArray = [PieceNode]()
  
  var lastNode :TailPiece?
  
  var currentMenu :UIView?
  
  override func didMove(to view: SKView) {
    print("moved to game scene")
    player = Player(scene: self)
    physicsWorld.contactDelegate = self;
    
    self.addChild(mainNode)
    createPlayer()
    
    
    
    
   
    
    let myAction = SKAction.move(by: CGVector(dx: 0, dy: -150), duration: 1.0)
    mainNode.run(SKAction.repeatForever(myAction) )
    //mainNode
    pieceFactory = PieceFactory(gameScene: self)
    
    
    let titleMenu = TitleMenuView(frame: CGRect.zero)
    
    view.addSubview(titleMenu)
    titleMenu.delegate = self
    
    
    titleMenu.frame = view.frame

    currentMenu = titleMenu
  }
  
  
  
  
  func createPieceNode(piece:Piece){
    
    
    
    let pieceNode = PieceNode(piece: piece)
    //TODO pass this through init
    
//    let piecePosition = CGPoint(x: piece.position.x, y: piece.position.y - mainNode.position.y + frame.height/2)
    let piecePosition = getPositionForScreen(position: piece.position)
    pieceNode.position = piecePosition
    pieceNode.size = getSizeForScreen(size: piece.size)
    mainNode.addChild(pieceNode)
    
    pieceNode.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 40, height: 40))
    pieceNode.physicsBody?.collisionBitMask = 0
    pieceNode.physicsBody?.contactTestBitMask = 1
    pieceNode.physicsBody?.categoryBitMask = PIECE_CATAGORY
    pieceNode.physicsBody?.isDynamic = true
    
    pieceArray.append(pieceNode)
  }

  
  
  override func update(_ currentTime: TimeInterval) {
    
    if let lastNode = lastNode {
      let dx = player.position.x - lastNode.position.x
      let dy = player.position.y - lastNode.position.y - mainNode.position.y
      let dist = sqrt(dx * dx + dy * dy);
      
      //check if should remove a node
      if let node = tailArray.first{
        if (node.position.y + mainNode.position.y) < (view!.frame.height * -1){
          tailArray.remove(at: 0)
          node.removeFromParent()
        }
      }
      
      if dist > 100{
      
        createTail()
        
      }
      
      
    }
    
  }
  
}

