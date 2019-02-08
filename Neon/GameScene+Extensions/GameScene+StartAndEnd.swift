

import SpriteKit

extension GameScene{
  
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
    
  }
  func createPlayer(){
    
    //TODO put this inside player
    
    self.addChild(player)
    
    //start with 3 lives
    player.addLife(scene:self)
    player.addLife(scene:self)
    player.addLife(scene:self)
    
    
    createTail()
  }
}

