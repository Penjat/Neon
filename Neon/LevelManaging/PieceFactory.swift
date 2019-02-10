

import SpriteKit

class PieceFactory{
  
  weak var gameScene :GameScene!
  var timer :Timer?
  
  
  init(gameScene: GameScene) {
    self.gameScene = gameScene
    
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
    let randX = CGFloat.random(in: -300...300)
    let point = CGPoint(x:randX , y: gameScene.frame.height/2)
    gameScene.createPiece(atPoint: point, shouldGet: true)
  }
}
