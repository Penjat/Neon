

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
    pieceFactory.startCreating()
    
    UIView.animate(withDuration: 2.0, animations: {
      self.currentMenu?.alpha = 0.0
      //TODO put in an if let
      self.currentMenu?.frame = CGRect(x: self.view!.frame.minX, y: self.view!.frame.minY + 100, width: self.view!.frame.width, height: self.view!.frame.height)
    }, completion: {(true) in
      self.currentMenu?.removeFromSuperview()
    })
  }
  
  func gameOver(){
    isPlaying = false
    mainNode.removeAllActions()
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
    //TODO animate out
    currentMenu?.removeFromSuperview()
    mainNode.position = CGPoint(x: 0,y: 0)
    player.startGame(scene: self)
    
    let myAction = SKAction.move(by: CGVector(dx: 0, dy: -150), duration: 1.0)
    mainNode.run(SKAction.repeatForever(myAction) )
    
  }
  func createPlayer(){
    
    //TODO put this inside player
    
    self.addChild(player)
  
    createTail()
  }
}

