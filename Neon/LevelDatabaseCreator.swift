//
//  LevelDatabaseCreator.swift
//  Neon
//
//  Created by Spencer Symington on 2019-02-15.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import CoreData


class LevelDatabeaseCreator{

  func setUpLevels(appDelegate:AppDelegate){
    print("setting up levels")
    
    
    
    let context = appDelegate.persistentContainer.viewContext
    
    //create the pieces
    let piece1 = Piece(context: context)
    piece1.type = 0
    piece1.color = 0
    piece1.x = 0.0
    piece1.y = 0.0
    piece1.width = 1.0
    piece1.height = 1.0
    piece1.isRandom = false
    
    let piece2 = Piece(context: context)
    piece2.type = 0
    piece2.color = 0
    piece2.x = 0.0
    piece2.y = 0.0
    piece2.width = 1.0
    piece2.height = 1.0
    piece2.isRandom = false
    
    //create the segment
    let segment1 = Segment(context: context)
    segment1.frequency = 50.0
    segment1.pieces = [piece1]
    
    //create section
    let section1 = Section(context: context)
    section1.speed = 30.0
    section1.distance = 300.0
    section1.orderId = 0
    section1.segments = [segment1]
    
    //create level 1
    let level1 = Level(context: context)
    level1.name = "level 1"
    level1.background = 0
    level1.difficulty = 1
    level1.direction = 0
    level1.music = 1
    level1.sections = [section1]
    
    
    
    
    appDelegate.saveContext()
    
    
    
  }
}
