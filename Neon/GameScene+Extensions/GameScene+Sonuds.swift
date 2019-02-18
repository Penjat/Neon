//
//  GameScene+Sonuds.swift
//  Neon
//
//  Created by Spencer Symington on 2019-02-17.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import SpriteKit

enum Sound{
  case Hit,Collect
}

extension GameScene{
  func play(sound:Sound){
    run(pickUpSound)
  }
}
