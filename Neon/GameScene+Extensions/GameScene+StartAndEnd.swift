//
//  GameScene+StartAndEnd.swift
//  Neon
//
//  Created by Spencer Symington on 2019-02-08.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import SpriteKit

extension GameScene{
  
  func gameOver(){
    isPlaying = false
    mainNode.removeAllActions()
  }
}

