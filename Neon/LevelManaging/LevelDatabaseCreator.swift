

import CoreData


class LevelDatabeaseCreator{

  func setUpLevels(appDelegate:AppDelegate){
    print("setting up levels")
    //TODO check if created rather than bypass
    //deleteData(appDelegate: appDelegate)
    //return
    if checkLevelsInstalled(appDelegate: appDelegate){
      return
    }
    
    let context = appDelegate.persistentContainer.viewContext
    
    let gameInfo = GameInfo(context: context)
    gameInfo.levels_installed = true
    
    createLevel1(context: context)
    
    
//    //create the pieces
//    let piece5 = Piece(context: context)
//    piece5.type = 0
//    piece5.color = 1
//    piece5.x = -10.0
//    piece5.y = 0.0
//    piece5.width = 3.0
//    piece5.height = 1.0
//    piece5.isRandom = false
//
//    let piece6 = Piece(context: context)
//    piece6.type = 0
//    piece6.color = 1
//    piece6.x = 0.0
//    piece6.y = 0.0
//    piece6.width = 2.0
//    piece6.height = 3.0
//    piece6.isRandom = false
//
//    //create the segment
//    let segment3 = Segment(context: context)
//    segment3.frequency = 50.0
//    segment3.spacing = 60.0
//    segment3.pieces = [piece5]
//
//    let segment4 = Segment(context: context)
//    segment4.frequency = 50.0
//    segment4.spacing = 40.0
//    segment4.pieces = [piece6]
//
//
//    let section3 = Section(context: context)
//    section3.speed = 30.0
//    section3.distance = 500.0
//    section3.orderId = 0
//    section3.segments = [segment3]
//
//    let section4 = Section(context: context)
//    section4.speed = 30.0
//    section4.distance = 500.0
//    section4.orderId = 1
//    section4.segments = [segment4]
//
//    //----------------------Level 2----------------------------------
//
//
//    let level2 = Level(context: context)
//    level2.name = "level 2"
//    level2.background = 0
//    level2.difficulty = 1
//    level2.direction = 0
//    level2.music = 1
//    level2.sections = [section3,section4]
    
    
    
    
    appDelegate.saveContext()
    
    
    
  }
  
  func checkLevelsInstalled(appDelegate:AppDelegate) -> Bool{
    //returns false if levels installed
    
    print("checking if levels installed")
    
    let request: NSFetchRequest<GameInfo> = GameInfo.fetchRequest()
    let context = appDelegate.persistentContainer.viewContext
    //    request.predicate = NSPredicate(format: "ANY name == %@", "level \(curLevelIndex)")
    
    if let results = try? context.fetch(request) , results.count > 0{
      print("levels already installed")
      return true
    }
    
    print("no gamedata found, should install levels")
    return false
  }
  
  func deleteData(appDelegate:AppDelegate){
    
    
    // Get a request object that knows how to retrieve Person objects from CoreData
    let request: NSFetchRequest<Level> = Level.fetchRequest()
    
    // Only retrieve person objects where name is equal to "Bob"
    //request.predicate = NSPredicate(format: "ANY name == %@", "level 1")
    
    let context = appDelegate.persistentContainer.viewContext
    if let results = try? context.fetch(request) {
      // If successful, results will be an array of Person objects
      for entity in results {
        print("deleting")
        context.delete(entity)
        // Check to see if there are any pets
        
      }
      appDelegate.saveContext()
    }
    else {
      print("Unable to retrieve data")
    }
  }
}
