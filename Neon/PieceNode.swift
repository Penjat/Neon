//
//  PieceNode.swift
//  Neon
//
//  Created by Spencer Symington on 2019-02-06.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import SpriteKit

class PieceNode: SKSpriteNode {
  //pieceNodes keeptrack of where the player is and if the player has circled them
  var player :SKSpriteNode?
  
  var angleOffset :CGFloat?
  var lowAngle :CGFloat?
  var highAngle :CGFloat?
  
  init(player: SKSpriteNode , pos:CGPoint){
    self.player = player
    angleOffset = atan2(pos.y - player.position.y, pos.x - player.position.x)*180/3.14
    lowAngle = angleOffset!-2
    highAngle = angleOffset!+2
    
    super.init(texture: nil, color: UIColor.blue, size: CGSize(width:20,height:20))
    self.position = pos
    
    
  }
  
  func findAngle(){
    if let player = player{
     let angle = atan2(player.position.y  - position.y, player.position.x -  position.x)*180/3.14
      
      if(angle > 0){
        let deltaLow = (angle-360)-lowAngle!
        let deltaHigh = (angle)-highAngle!
        if(abs(deltaLow) < abs(deltaHigh)){
          if(angle-360 < lowAngle!){
            lowAngle = angle-360
          }
          
        }else{
          if(angle > highAngle!){
            highAngle = angle
          }
        }
      }else if angle < 0{
        let deltaLow = (angle)-lowAngle!
        let deltaHigh = (angle+360)-highAngle!
        if(abs(deltaLow) < abs(deltaHigh)){
          if(angle < lowAngle!){
            lowAngle = angle
          }
        }else{
          if(angle+360 > highAngle!){
            highAngle = angle+360
          }
        }
      }
      
      print("high = \(highAngle) low = \(lowAngle)")
      let total = abs(highAngle! - lowAngle!)
      print("total = \(total)")
      if total >= 358{
        
        removeFromParent()
      }
      
      
    }
    
    
  }
  
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
}
