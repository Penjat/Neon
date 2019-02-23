//
//  GameScene+PieceSizing.swift
//  Neon
//
//  Created by Spencer Symington on 2019-02-10.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import SpriteKit

extension GameScene{
  func getSizeForScreen(size:CGSize) -> CGSize {
    let ratio = frame.width / 32.0
    
    return CGSize(width: size.width  * ratio, height: size.height*ratio )
    
  }
  func getPositionForScreen(position: CGPoint) -> CGPoint{
    let ratio = frame.width / 32.0
    
    return CGPoint(x: ( position.x  * ratio), y: position.y * ratio - movingNode.position.y + frame.height/2.0)
  }
  
  func getRatio()->Float{
    return Float(frame.width / 32.0)
  }
}
