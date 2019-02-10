//
//  GameScene+PieceSizing.swift
//  Neon
//
//  Created by Spencer Symington on 2019-02-10.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import SpriteKit

extension GameScene{
  func getSizeForScreen(width:Int , height:Int) -> CGSize {
    let ratio = frame.width / 32.0
    
    return CGSize(width: ( CGFloat(integerLiteral: width)  * ratio), height: (CGFloat(integerLiteral:height)*ratio ))
    
  }
  func getPositionForScreen(x: Int , y: Int) -> CGPoint{
    let ratio = frame.width / 32.0
    
    return CGPoint(x: ( CGFloat(integerLiteral: x)  * ratio), y: (CGFloat(integerLiteral:y)*ratio - mainNode.position.y + frame.height/2.0))
  }
}
