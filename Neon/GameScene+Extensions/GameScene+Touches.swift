//
//  GameScene+Touches.swift
//  Neon
//
//  Created by Spencer Symington on 2019-02-07.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import SpriteKit

extension GameScene {
  func touchDown(atPoint pos : CGPoint) {
    path.addLine(to: pos)
    
    
  }
  
  func touchMoved(toPoint pos : CGPoint) {
    
  }
  
  func touchUp(atPoint pos : CGPoint) {
    
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    
    //check if game has started
    if !isPlaying {
      return
    }
    
    for t in touches {
      
      player.position = t.location(in: self)
    }
  }
  
  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    
    //check if game has started
    if !isPlaying {
      return
    }
    
    for t in touches {
      
      player.position = t.location(in: self)
    }
    
    
    
    
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    for t in touches { self.touchUp(atPoint: t.location(in: self)) }
  }
  
  override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    for t in touches { self.touchUp(atPoint: t.location(in: self)) }
  }
}
