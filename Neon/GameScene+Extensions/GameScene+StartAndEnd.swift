

import SpriteKit

extension GameScene{
  
  func gameOver(){
    isPlaying = false
    mainNode.removeAllActions()
    let gameOverMenu = GameOverView(frame: CGRect.zero)
    gameOverMenu.delegate = self
    
    
    gameOverMenu.frame = view!.frame
    
    currentMenu = gameOverMenu
    
  }
}

