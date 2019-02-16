//
//  Player+Animations.swift
//  Neon
//
//  Created by Spencer Symington on 2019-02-16.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import SpriteKit

extension Player{
  
  func introAnimation(gameScene:GameScene){
    let y = CGFloat(-gameScene.frame.height/2 - 100.0)
    position = CGPoint(x:-100,y:y)
    
    let introAnimation = SKAction.move(to: CGPoint(x:200,y:0), duration: 6.0)
    run(introAnimation)
  }
}
