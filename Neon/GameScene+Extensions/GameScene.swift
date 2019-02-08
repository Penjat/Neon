

import SpriteKit
import GameplayKit

class GameScene: SKScene , SKPhysicsContactDelegate {
  
  
  let PLAYER_CATAGORY :UInt32 = 1
  let PIECE_CATAGORY :UInt32 = 2
  let TAIL_CATAGORY :UInt32 = 3
  
  
  
  let mainNode = SKNode()
  let path = UIBezierPath()
  var player :Player!
  var pieceFactory :PieceFactory!
  var tailArray = [SKSpriteNode]()
  
  var lastNode :SKSpriteNode?
  
  override func didMove(to view: SKView) {
    print("moved to game scene")
    player = Player(scene: self)
    physicsWorld.contactDelegate = self;
    
    self.addChild(mainNode)
    createPlayer()
    
    
    
    createPiece(atPoint: CGPoint(x: 100, y: 200), shouldGet: true)
    createPiece(atPoint: CGPoint(x: 200, y: 200), shouldGet: false)
    createPiece(atPoint: CGPoint(x: 200, y: 200), shouldGet: false)
    createPiece(atPoint: CGPoint(x: -100, y: 200), shouldGet: true)
    createPiece(atPoint: CGPoint(x: -200, y: 200), shouldGet: false)
   
    
    let myAction = SKAction.move(by: CGVector(dx: 0, dy: -150), duration: 1.0)
    mainNode.run(SKAction.repeatForever(myAction) )
    //mainNode
    pieceFactory = PieceFactory(gameScene: self)
    pieceFactory.startCreating()
  }
  
  func createPlayer(){
    
    //TODO put this inside player
    player.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width:20,height:20))
    player.physicsBody?.collisionBitMask = 2
    player.physicsBody?.contactTestBitMask = 1
    player.physicsBody?.categoryBitMask = PLAYER_CATAGORY
    player.physicsBody?.isDynamic = false
    self.addChild(player)
    
    //start with 3 lives
    player.addLife(scene:self)
    player.addLife(scene:self)
    player.addLife(scene:self)
    
    
    createTail()
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
  }

  
  
  override func update(_ currentTime: TimeInterval) {
    
    if let lastNode = lastNode {
      let dx = player.position.x - lastNode.position.x
      let dy = player.position.y - lastNode.position.y - mainNode.position.y
      let dist = sqrt(dx * dx + dy * dy);
      
      if dist > 100{
        createTail()
      }
      
    }
    
  }
  
}

