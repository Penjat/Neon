

import SpriteKit
import GameplayKit

class GameScene: SKScene , SKPhysicsContactDelegate {
  
  private var label : SKLabelNode?
  private var spinnyNode : SKShapeNode?
  
  let PLAYER_CATAGORY :UInt32 = 1
  let PIECE_CATAGORY :UInt32 = 2
  let TAIL_CATAGORY :UInt32 = 3
  
  let mainNode = SKNode()
  let line = SKShapeNode()
  let path = UIBezierPath()
  let player = SKSpriteNode(color: UIColor.blue, size: CGSize(width:30,height:30))
  let points = NSCache<AnyObject, AnyObject>()
  var pointArray = [CGPoint]()
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
    
    let startPoint = CGPoint.zero
    
    
    // Create line with SKShapeNode
    
    path.move(to: startPoint)
    //path.addLine(to: endPoint)
    line.path = path.cgPath
    line.strokeColor = UIColor.init(displayP3Red: 0.4, green: 0.0, blue: 1.0, alpha: 0.3)
    line.lineWidth = 30
//    line.glowWidth = 20
    line.lineCap = CGLineCap.round
    
    createTail()
    
    
    mainNode.addChild(line)
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
  
  func createTail(){
    lastNode = SKSpriteNode(color: UIColor.red, size: CGSize(width: 20, height: 20))
    
    let relPos = CGPoint(x:player.position.x,y:player.position.y - mainNode.position.y)
    lastNode?.position = relPos
    mainNode.addChild(lastNode!)
    tailArray.append(lastNode!)
    
    
    if tailArray.count < 4{
      return
    }
    var a1 = tailArray[0].position
    let b1 = relPos
    let b2 = tailArray[tailArray.count - 2].position
    for i in 1 ..< tailArray.count-3{
      let a2 = tailArray[i].position
      let intersectPoint = getIntersectionOfLines(line1: (a: a1, b: a2), line2: (a: b1, b: b2))
      if intersectPoint != nil{
        
        let spot = SKSpriteNode(color: UIColor.green, size: CGSize(width: 20, height: 20))
        spot.position = intersectPoint!
        mainNode.addChild(spot)
        let subArray = tailArray[i ..< tailArray.count-1]
        tailArray = [SKSpriteNode]() + tailArray[0...i]
        var mutaPath = CGMutablePath()
        
        var firstPoint = true
        for node in subArray{
          if firstPoint {
            mutaPath.move(to: node.position)
            firstPoint = false
          }else{
            
          }
          mutaPath.addLine(to: node.position)
        }
        let polygon = SKShapeNode()
        polygon.path = mutaPath.copy()
        //polygon.fillColor = UIColor.green
        polygon.strokeColor = UIColor.blue
        polygon.physicsBody = SKPhysicsBody(polygonFrom: mutaPath.copy()!)
        polygon.physicsBody?.categoryBitMask = TAIL_CATAGORY
        polygon.physicsBody?.collisionBitMask = 0
        polygon.physicsBody?.contactTestBitMask = 1
        
        let wait = SKAction.wait(forDuration: 0.5)
        let removeSlef = SKAction.removeFromParent()
        let actions = [wait,removeSlef]
        polygon.run(SKAction.sequence(actions))
        
        mainNode.addChild(polygon)
        print("muta path = \(subArray.count)")
        print("the lines intersect")
        return
      }
      a1 = a2
    }
  }
  
  
  func getIntersectionOfLines(line1: (a: CGPoint, b: CGPoint), line2: (a: CGPoint, b: CGPoint)) -> CGPoint? {
    
    let distance = (line1.b.x - line1.a.x) * (line2.b.y - line2.a.y) - (line1.b.y - line1.a.y) * (line2.b.x - line2.a.x)
    if distance == 0 {
      //print("error, parallel lines")
      return nil
    }
    
    let u = ((line2.a.x - line1.a.x) * (line2.b.y - line2.a.y) - (line2.a.y - line1.a.y) * (line2.b.x - line2.a.x)) / distance
    let v = ((line2.a.x - line1.a.x) * (line1.b.y - line1.a.y) - (line2.a.y - line1.a.y) * (line1.b.x - line1.a.x)) / distance
    
    if (u < 0.0 || u > 1.0) {
      //print("error, intersection not inside line1")
      return nil
    }
    if (v < 0.0 || v > 1.0) {
      //print("error, intersection not inside line2")
      return nil
    }
    
    return CGPoint(x: line1.a.x + u * (line1.b.x - line1.a.x), y: line1.a.y + u * (line1.b.y - line1.a.y))
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
    
    
    
    // Called before each frame is rendered
    //line.path = path.cgPath
    
//    let relPos = CGPoint(x:player.position.x,y:player.position.y - mainNode.position.y)
//    pointArray.append(relPos)
//      let mutablePath = CGMutablePath()
//      mutablePath.addLines(between: pointArray)
//      //path.addLine(to: relPos)
//      line.path = mutablePath
//
////    if pointArray.count > 1000{
////      pointArray.remove(at: 0)
////    }
//    if pointArray.count > 0{
//      if pointArray[0].y - mainNode.position.y > 500{
//        pointArray.remove(at: 0)
//      }
//    }
    
  }
  
}

