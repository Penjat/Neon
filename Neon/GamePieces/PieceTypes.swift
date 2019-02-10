//
//  PieceTypes.swift
//  Neon
//
//  Created by Spencer Symington on 2019-02-10.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import SpriteKit

//which piece behaviour or sprite
enum PieceType{
  
}

//what happens when it is collected
enum CollectType{
  case DamagePlayer
  case Points
  case PointsMultiplier
  case PointInverseMultiplier
  
  func getColor() -> UIColor {
    
    switch self {
      
    case .DamagePlayer:
      return UIColor.red
    case .Points:
      return UIColor.blue
    case .PointsMultiplier:
      return UIColor.purple
    case .PointInverseMultiplier:
      return UIColor.green
    }
  }
}
