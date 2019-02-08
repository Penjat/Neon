//
//  MenuDelegateProtocol.swift
//  Neon
//
//  Created by Spencer Symington on 2019-02-08.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import SpriteKit

protocol MenuDelegate {
  
  //TODO pass in more paramaters
  func startGame()
  func toTitleMenu()
  func reStartGame()
}
