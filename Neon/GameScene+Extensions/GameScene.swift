

import SpriteKit
import GameplayKit

class GameScene: SKScene , SKPhysicsContactDelegate {
  
  private var label : SKLabelNode?
  private var spinnyNode : SKShapeNode?
  
  let PLAYER_CATAGORY :UInt32 = 1
  let PIECE_CATAGORY :UInt32 = 2
  let TAIL_CATAGORY :UInt32 = 3
  
  let mainNode = SKNode()
  let path = UIBezierPath()
  let player = SKSpriteNode(color: UIColor.blue, size: CGSize(width:30,height:30))
  var tailArray = [SKSpriteNode]()
  
  var lastNode :SKSpriteNode?
  
  override func didMove(to view: SKView) {
    print("moved to game scene")
    physicsWorld.contactDelegate = self;
    
    self.addChild(mainNode)
    
    player.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width:30,height:30))
    player.physicsBody?.collisionBitMask = 2
    player.physicsBody?.contactTestBitMask = 1
    player.physicsBody?.categoryBitMask = PLAYER_CATAGORY
    player.physicsBody?.isDynamic = false
    self.addChild(player)
    
   
    
    createTail()
    
    
    let myAction = SKAction.move(by: CGVector(dx: 0, dy: -150), duration: 1.0)
    
    let piece1 = PieceNode(color: UIColor.blue, size: CGSize(width:80,height:80))
    piece1.position = CGPoint(x: 200, y: 300)
    mainNode.addChild(piece1)
    
    piece1.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 80, height: 80))
    piece1.physicsBody?.collisionBitMask = 0
    piece1.physicsBody?.contactTestBitMask = 1
    piece1.physicsBody?.categoryBitMask = PIECE_CATAGORY
    piece1.physicsBody?.isDynamic = true
    
    let piece2 = PieceNode(color: UIColor.blue, size: CGSize(width:80,height:80))
    piece2.position = CGPoint(x: -200, y: 100)
    mainNode.addChild(piece2)
    //mainNode.run(SKAction.repeatForever(myAction) )
    //mainNode
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

