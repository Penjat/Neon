
import SpriteKit

extension Player{
  
  func introAnimation(gameScene:GameScene){
    let y = CGFloat(-gameScene.frame.height/2 - 100.0)
    position = CGPoint(x:-50,y:y)
    
    let introAnimation = SKAction.move(to: CGPoint(x:50,y:0), duration: 6.0)
    run(introAnimation)
  }
}
