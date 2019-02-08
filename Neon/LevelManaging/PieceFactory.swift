//
//  PieceFactory.swift
//  Neon
//
//  Created by Spencer Symington on 2019-02-08.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import SpriteKit

class PieceFactory{
  
  weak var gameScene :GameScene!
  
  init(gameScene: GameScene) {
    self.gameScene = gameScene
    
  }
  
  func startCreating(){
    //start creating pieces for the level
    let timer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true, block: {timer in self.createNextSection()})
  }
  
  func createNextSection(){
    print("creating next section")
    let point = CGPoint(x:0 , y: gameScene.frame.height/2)
    gameScene.createPiece(atPoint: point, shouldGet: true)
  }
}
