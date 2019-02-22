

import SpriteKit
import GameplayKit

class GameScene: SKScene , SKPhysicsContactDelegate , MenuDelegate {
  var hurtSound = SKAction.playSoundFileNamed("hurt.wav", waitForCompletion: false)
  var pickUpSound = SKAction.playSoundFileNamed("pickUpSound.wav", waitForCompletion: false)
  
  
  
  
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

