

import CoreData


class LevelDatabeaseCreator{

  func setUpLevels(appDelegate:AppDelegate){
    print("setting up levels")
    //TODO check if created rather than bypass
    //deleteData(appDelegate: appDelegate)
    //return
    
    let context = appDelegate.persistentContainer.viewContext
    
    //create the pieces
    let piece1 = Piece(context: context)
    piece1.type = 0
    piece1.color = 0
    piece1.x = -2.0
    piece1.y = 0.0
    piece1.width = 1.0
    piece1.height = 1.0
    piece1.isRandom = false
    
    let piece2 = Piece(context: context)
    piece2.type = 0
    piece2.color = 0
    piece2.x = 2.0
    piece2.y = 0.0
    piece2.width = 1.0
    piece2.height = 1.0
    piece2.isRandom = false
    
    //create the segment
    let segment1 = Segment(context: context)
    segment1.frequency = 50.0
    segment1.spacing = 20.0
    segment1.pieces = [piece1,piece2]
    
    //create the pieces
    let piece3 = Piece(context: context)
    piece3.type = 0
    piece3.color = 1
    piece3.x = -4.0
    piece3.y = 0.0
    piece3.width = 1.0
    piece3.height = 1.0
    piece3.isRandom = false
    
    let piece4 = Piece(context: context)
    piece4.type = 0
    piece4.color = 1
    piece4.x = 3.0
    piece4.y = 0.0
    piece4.width = 2.0
    piece4.height = 2.0
    piece4.isRandom = false
    
    //create the segment
    let segment2 = Segment(context: context)
    segment2.frequency = 50.0
    segment2.spacing = 20.0
    segment2.pieces = [piece3,piece4]
    
    //create the pieces
    let piece5 = Piece(context: context)
    piece5.type = 0
    piece5.color = 1
    piece5.x = -10.0
    piece5.y = 0.0
    piece5.width = 3.0
    piece5.height = 1.0
    piece5.isRandom = false
    
    let piece6 = Piece(context: context)
    piece6.type = 0
    piece6.color = 1
    piece6.x = 0.0
    piece6.y = 0.0
    piece6.width = 2.0
    piece6.height = 3.0
    piece6.isRandom = false
    
    //create the segment
    let segment3 = Segment(context: context)
    segment3.frequency = 50.0
    segment3.spacing = 60.0
    segment3.pieces = [piece5]
    
    let segment4 = Segment(context: context)
    segment4.frequency = 50.0
    segment4.spacing = 40.0
    segment4.pieces = [piece6]
    
    
    
    //create section
    let section1 = Section(context: context)
    section1.speed = 30.0
    section1.distance = 500.0
    section1.orderId = 0
    section1.segments = [segment1]
    
    let section2 = Section(context: context)
    section2.speed = 30.0
    section2.distance = 500.0
    section2.orderId = 1
    section2.segments = [segment2]
    
    let section3 = Section(context: context)
    section3.speed = 30.0
    section3.distance = 500.0
    section3.orderId = 0
    section3.segments = [segment3]
    
    let section4 = Section(context: context)
    section4.speed = 30.0
    section4.distance = 500.0
    section4.orderId = 1
    section4.segments = [segment4]
    
    //create level 1
    let level1 = Level(context: context)
    level1.name = "level 1"
    level1.background = 0
    level1.difficulty = 1
    level1.direction = 0
    level1.music = 1
    level1.sections = [section1,section2]
    
    let level2 = Level(context: context)
    level2.name = "level 2"
    level2.background = 0
    level2.difficulty = 1
    level2.direction = 0
    level2.music = 1
    level2.sections = [section3,section4]
    
    
    
    
    appDelegate.saveContext()
    
    
    
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
