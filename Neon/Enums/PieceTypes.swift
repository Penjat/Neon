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
  func asInt() -> Int16{
    switch (self){
    case .DamagePlayer:
        return 0
    case .Points:
      return 1
    case .PointsMultiplier:
      return 2
    case .PointInverseMultiplier:
      return 3
      
    }
  }
  
  static func getCollectType(colorAsInt:Int)->CollectType{
    switch(colorAsInt){
    case 0:
      return .DamagePlayer
    case 1:
      return .Points
    case 2:
      return .PointsMultiplier
    case 3:
      return .PointInverseMultiplier
    default:
      return .Points
    }
  }
}
