

import SpriteKit

extension GameScene{
  
  func startGame(){
    
    
    //do nothing if already playing
    if isPlaying {
      return
    }
    player.startGame(scene: self)
    isPlaying = true
    player.isFlashing = false
    pieceFactory.startCreating(moveingNode: movingNode)
    
    UIView.animate(withDuration: 2.0, animations: {
      self.currentMenu?.alpha = 0.0
      //TODO put in an if let
      self.currentMenu?.frame = CGRect(x: self.view!.frame.minX, y: self.view!.frame.minY + 100, width: self.view!.frame.width, height: self.view!.frame.height)
    }, completion: {(true) in
      self.currentMenu?.removeFromSuperview()
    })
  }
  
  func gameOver(){
    
    //remove the old menu in cass of duplicates
    if let currentMenu = currentMenu {
      currentMenu.removeFromSuperview()
    }
    isPlaying = false
    movingNode.removeAllActions()
    let gameOverMenu = GameOverView(frame: CGRect.zero)
    gameOverMenu.delegate = self
    
    pieceFactory.stopCreating()
    gameOverMenu.frame = view!.frame
    view?.addSubview(gameOverMenu)
    currentMenu = gameOverMenu
    
  }
  
  func toTitleMenu() {
    
  }
  
  func reStartGame() {
    
    
    
    //remove all tail pieces and clear array
    for tail in tailArray{
      tail.removeFromParent()
    }
    tailArray.removeAll()
    
    //remove all pieces and clear array
    for piece in pieceArray{
      piece.removeFromParent()
    }
    pieceArray.removeAll()
    
    
    //TODO animate out
    currentMenu?.removeFromSuperview()
    currentMenu = nil
    movingNode.position = CGPoint(x: 0,y: 0)
    player.startGame(scene: self)
    
    //make sure main node is not already moving
    movingNode.removeAllActions()
    let myAction = SKAction.move(by: CGVector(dx: 0, dy: -150), duration: 1.0)
    movingNode.run(SKAction.repeatForever(myAction) )
    
    pieceFactory.startCreating(moveingNode: movingNode)
    isPlaying = true
  }
  func createPlayer(){
    
    //TODO put this inside player
    
    self.staticNode.addChild(player)
  
    createTail()
  }
}

