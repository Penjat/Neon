

import SpriteKit
import GameplayKit

class GameScene: SKScene , SKPhysicsContactDelegate , MenuDelegate {
  var hurtSound = SKAction.playSoundFileNamed("Hit_Hurt.wav", waitForCompletion: false)
  var pickUpSound = SKAction.playSoundFileNamed("pickUpSound.wav", waitForCompletion: true)
  
  
  
  
  var isPlaying = false
  
  let movingNode = SKNode()
  let staticNode = SKNode()
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
    
    addChild(staticNode)
    staticNode.addChild(movingNode)
    
    createPlayer()
    
    
    
    
   
    
    let myAction = SKAction.move(by: CGVector(dx: 0, dy: -150), duration: 1.0)
    movingNode.run(SKAction.repeatForever(myAction) )
    //mainNode
    
    if let appDelegate = UIApplication.shared.delegate as? AppDelegate { let
      levelDB = LevelDatabeaseCreator()
      levelDB.setUpLevels(appDelegate: appDelegate)
    }
    pieceFactory = PieceFactory(gameScene: self)
    
    
    let titleMenu = TitleMenuView(frame: CGRect.zero)
    titleMenu.alpha = 0.0
    
    UIView.animate(withDuration: 1.0, delay: 5.0, options:[], animations: {
      titleMenu.alpha = 1.0
      }, completion: nil)
    view.addSubview(titleMenu)
    titleMenu.delegate = self
    
    
    titleMenu.frame = view.frame

    currentMenu = titleMenu
    player.introAnimation(gameScene: self)
    
  }
  
  
  
  
  func createPieceNode(piece:Piece){
    
    
    
    let pieceNode = PieceNode(piece: piece)
    //TODO pass this through init
    
//    let piecePosition = CGPoint(x: piece.position.x, y: piece.position.y - mainNode.position.y + frame.height/2)
    
    //TODO set values with piece
    let x = CGFloat(piece.x)
    let y = CGFloat(piece.y)
    let width = CGFloat(piece.width)
    let height = CGFloat(piece.height)
    let piecePosition = getPositionForScreen(position: CGPoint(x:x,y:y) )
    pieceNode.position = piecePosition
    pieceNode.size = getSizeForScreen(size: CGSize(width:width,height:height))
    movingNode.addChild(pieceNode)
    
    pieceNode.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 40, height: 40))
    pieceNode.physicsBody?.collisionBitMask = 0
    pieceNode.physicsBody?.contactTestBitMask = 1
    pieceNode.physicsBody?.categoryBitMask = PIECE_CATAGORY
    pieceNode.physicsBody?.isDynamic = true
    
    pieceArray.append(pieceNode)
  }

  
  
  override func update(_ currentTime: TimeInterval) {
    pieceFactory.checkShouldCreate(moveingNode: movingNode)
    if let lastNode = lastNode {
      let dx = player.position.x - lastNode.position.x
      let dy = player.position.y - lastNode.position.y - movingNode.position.y
      let dist = sqrt(dx * dx + dy * dy);
      
      //check if should remove a node
      if let node = tailArray.first{
        if (node.position.y + movingNode.position.y) < (view!.frame.height * -1){
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

