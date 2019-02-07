

import SpriteKit
import GameplayKit

class GameScene: SKScene {
  
  private var label : SKLabelNode?
  private var spinnyNode : SKShapeNode?
  
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
    
    self.addChild(mainNode)
    
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
    
    
    mainNode.run(SKAction.repeatForever(myAction) )
    //mainNode
  }
  func createTail(){
    lastNode = SKSpriteNode(color: UIColor.red, size: CGSize(width: 20, height: 20))
    
    let relPos = CGPoint(x:player.position.x,y:player.position.y - mainNode.position.y)
    lastNode?.position = relPos
    mainNode.addChild(lastNode!)
    tailArray.append(lastNode!)
    
    //check if the bounding boxes collide
    if tailArray.count < 4{
      return
    }
    var a1 = tailArray[0].position
    let b1 = relPos
    let b2 = tailArray[tailArray.count - 2].position
    for i in 1 ..< tailArray.count-3{
      var a2 = tailArray[i].position
      let intersectPoint = getIntersectionOfLines(line1: (a: a1, b: a2), line2: (a: b1, b: b2))
      if intersectPoint != nil{
      //if doBoundingBoxesIntersect(a1: a1 , a2: a2 , b1: b1 ,b2: b2 ){
        let spot = SKSpriteNode(color: UIColor.green, size: CGSize(width: 20, height: 20))
        spot.position = intersectPoint!
        mainNode.addChild(spot)
        print("the lines intersect")
        return
      }
      a1 = a2
    }
  }
  func doBoundingBoxesIntersect(a1:CGPoint , a2:CGPoint , b1:CGPoint , b2:CGPoint) -> Bool {
    let x1 = min(a1.x,a2.x)
    let y1 = min(a1.y , a2.y)
    let width1 = max(a1.x,a2.x)-x1
    let height1 = max(a1.y,a2.y)-y1
    
    let x2 = min(b1.x,b2.x)
    let y2 = min(b1.y , b2.y)
    let width2 = max(b1.x,b2.x)-x2
    let height2 = max(b1.y,b2.y)-y2
    
    
    let rect1 = CGRect(x: x1 ,y: y1 ,width: width1,height: height1 )
    let rect2 = CGRect(x: x2 ,y: y2 ,width: width2,height: height2 )
    return rect1.intersects(rect2)
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
  
  
  func touchDown(atPoint pos : CGPoint) {
    path.addLine(to: pos)
    
    
  }
  
  func touchMoved(toPoint pos : CGPoint) {
    
  }
  
  func touchUp(atPoint pos : CGPoint) {
    
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    
    
    for t in touches {
      
      player.position = t.location(in: self)
    }
  }
  
  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    for t in touches {
      
      player.position = t.location(in: self)
    }
    
    
    
    
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    for t in touches { self.touchUp(atPoint: t.location(in: self)) }
  }
  
  override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    for t in touches { self.touchUp(atPoint: t.location(in: self)) }
  }
  
  
  override func update(_ currentTime: TimeInterval) {
    if let lastNode = lastNode {
      let dx = player.position.x - lastNode.position.x
      let dy = player.position.y - lastNode.position.y - mainNode.position.y
      let dist = sqrt(dx * dx + dy * dy);
      
      if dist > 50{
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
extension CGPoint {
  
  /**
   Calculates a distance to the given point.
   
   :param: point - the point to calculate a distance to
   
   :returns: distance between current and the given points
   */
  func distance(point: CGPoint) -> CGFloat {
    let dx = self.x - point.x
    let dy = self.y - point.y
    return sqrt(dx * dx + dy * dy);
  }
}
