

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
//    titleMenu.translatesAutoresizingMaskIntoConstraints = false
//    NSLayoutConstraint(item: titleMenu, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0).isActive = true
//    NSLayoutConstraint(item: titleMenu, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 0).isActive = true
//    NSLayoutConstraint(item: titleMenu, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 400).isActive = true
//    NSLayoutConstraint(item: titleMenu, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 400).isActive = true
    currentMenu = titleMenu
  }
  
  
  
  
  func createPiece(atPoint: CGPoint , shouldGet:Bool){
    var color = UIColor.blue
    if !shouldGet {
      color = UIColor.red
    }
    
    
    let piece = PieceNode(color: color, size: CGSize(width:40,height:40))
    //TODO pass this through init
    piece.shouldGet = shouldGet
    let piecePosition = CGPoint(x:atPoint.x, y: atPoint.y - mainNode.position.y)
    piece.position = piecePosition
    mainNode.addChild(piece)
    
    piece.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 40, height: 40))
    piece.physicsBody?.collisionBitMask = 0
    piece.physicsBody?.contactTestBitMask = 1
    piece.physicsBody?.categoryBitMask = PIECE_CATAGORY
    piece.physicsBody?.isDynamic = true
    
    pieceArray.append(piece)
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

