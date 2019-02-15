//
//  LevelDatabaseCreator.swift
//  Neon
//
//  Created by Spencer Symington on 2019-02-15.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import CoreData

class LevelDatabeaseCreator{
private var appDelegate: AppDelegate? = nil
  func setUpLevels(){
    print("setting up levels")
    
    guard let appDelegate = self.appDelegate else {
      assertionFailure("Unable to retrieve app delegate")
      return
    }
    
    // Create our managed objects
    let context = appDelegate.persistentContainer.viewContext
    let level1 = Level(context: context)
    level1.name = "level 1"
  }
}
