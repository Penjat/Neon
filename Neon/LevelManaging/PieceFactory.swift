

import SpriteKit

class PieceFactory{
  
  weak var gameScene :GameScene!
  var timer :Timer?
  var curLevel :Level!
  
  
  init(gameScene: GameScene) {
    self.gameScene = gameScene
    
    let piece = Piece(position:CGPoint(x: 0,y: 0 ) , size: CGSize(width: 2, height: 1), collectType: CollectType.DamagePlayer)
    let segment = Segment(pieces: [piece] )
    
    let piece1 = Piece(position:CGPoint(x: 6,y: 0 ) , size: CGSize(width: 2, height: 1), collectType: CollectType.Points)
    let piece2 = Piece(position:CGPoint(x: -6,y: 0 ) , size: CGSize(width: 2, height: 1), collectType: CollectType.Points)
    
    let segment1 = Segment(pieces: [piece1,piece2] )
    curLevel = Level(segments: [segment,segment1])
    
  }
  
  func startCreating(){
    //start creating pieces for the level
    timer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true, block: {timer in self.createNextSection()})
  }
  func stopCreating(){
    timer?.invalidate()
    timer = nil
  }
  
  func createNextSection(){
    print("creating next section")
    
    //TODO get actual size of the frame
//    let randX = CGFloat.random(in: -300...300)
//    let point = CGPoint(x:randX , y: gameScene.frame.height/2)
    
    
    let segment = curLevel.getNextSegment()
    for piece in segment.pieces{
      gameScene.createPieceNode(piece:piece)
    }
    
    
  }
}
