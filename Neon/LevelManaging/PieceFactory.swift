

import SpriteKit
import CoreData


class PieceFactory{
  
  weak var gameScene :GameScene!
  var timer :Timer?
  var curLevel :Level!
  var distUntilNextSegment :CGFloat = 0.0
  var isCreating = false
  
  init(gameScene: GameScene) {
    self.gameScene = gameScene
    
//    let piece = Piece(position:CGPoint(x: 0,y: 0 ) , size: CGSize(width: 2, height: 1), collectType: CollectType.DamagePlayer)
//    let segment = Segment(pieces: [piece] )
//    
//    let piece1 = Piece(position:CGPoint(x: 6,y: 0 ) , size: CGSize(width: 2, height: 1), collectType: CollectType.Points)
//    let piece2 = Piece(position:CGPoint(x: -6,y: 0 ) , size: CGSize(width: 2, height: 1), collectType: CollectType.Points)
//    
//    let segment1 = Segment(pieces: [piece1,piece2] )
//    curLevel = Level(segments: [segment,segment1])
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let request: NSFetchRequest<Level> = Level.fetchRequest()
    let context = appDelegate.persistentContainer.viewContext
    request.predicate = NSPredicate(format: "ANY name == %@", "level 1")
    if let results = try? context.fetch(request) , results.count > 0{
      self.curLevel = results[0]
    }else{
      print("was unable to load levels")
    }
    //print("the current level is \(curLevel.name)")
    
  }
  
  func startCreating(moveingNode:SKNode){
    //start creating pieces for the level
//    timer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true, block: {timer in self.createNextSection()})
    isCreating = true
    distUntilNextSegment = moveingNode.position.y
  }
  func stopCreating(){
//    timer?.invalidate()
//    timer = nil
    isCreating = false
  }
  func checkShouldCreate(moveingNode:SKNode){
    if(!isCreating){
      return
    }
    
    //check moving node's distance and see if it is time to create another segment
    if(moveingNode.position.y < distUntilNextSegment){
      //TODO maybe make sure multiple are not being made
      createNextSegment(moveingNode: moveingNode)
    }
  }
  func createNextSegment(moveingNode:SKNode){
    print("creating next section")
    
    let section = curLevel.sections?.anyObject() as! Section
    let segmentArray = section.segments!.allObjects as! [Segment]
    let segment = segmentArray.randomElement()
    
    
    let pieceArray = segment!.pieces!.allObjects as! [Piece]
    for piece in pieceArray{
      gameScene.createPieceNode(piece:piece)
    }
    print("segment spacing = \(segment!.spacing)")
    distUntilNextSegment -= CGFloat(segment!.spacing*10)
    
    
    //TODO get actual size of the frame
//    let randX = CGFloat.random(in: -300...300)
//    let point = CGPoint(x:randX , y: gameScene.frame.height/2)
    
    
//    let segment = curLevel.getNextSegment()
//    for piece in segment.pieces{
//      gameScene.createPieceNode(piece:piece)
//    }
    
    
  }
  
  
}
