

import CoreData

extension LevelDatabeaseCreator{
  
  func createLevel2(context:NSManagedObjectContext){
    let level = Level(context: context)
    level.name = "level 2"
    level.background = 0
    level.difficulty = 1
    level.direction = 0
    level.music = 1
    //level.sections = [section1,section4]
    
    //------------------Section 1-----------------------
    let section1 = Section(context: context)
    section1.speed = 30.0
    section1.distance = 500.0
    section1.orderId = 0
    //section1.segments = [segment3]
    level.add(section: section1)
    
    //create the segment
    let segment_1_1 = Segment(context: context)
    segment_1_1.frequency = 50.0
    segment_1_1.spacing = 60.0
    section1.add(segment: segment_1_1)
    //segment3.pieces = [piece5]
    
    
    let piece6 = Piece(context: context)
    piece6.type = 0
    piece6.color = 1
    piece6.x = 0.0
    piece6.y = 0.0
    piece6.width = 2.0
    piece6.height = 3.0
    piece6.isRandom = false
    segment_1_1.add(piece: piece6)
    
    //--------------------Section 2------------------------
    let section2 = Section(context: context)
    section2.speed = 30.0
    section2.distance = 500.0
    section2.orderId = 1
    //section2.segments = [segment4]
    level.add(section: section2)
    
    let segment_1_2 = Segment(context: context)
    segment_1_2.frequency = 50.0
    segment_1_2.spacing = 40.0
    //segment_1_2.pieces = [piece6]
    section2.add(segment: segment_1_2)
    
    //create the pieces
    let piece5 = Piece(context: context)
    piece5.type = 0
    piece5.color = 1
    piece5.x = -10.0
    piece5.y = 0.0
    piece5.width = 3.0
    piece5.height = 1.0
    piece5.isRandom = false
    segment_1_2.add(piece: piece5)
    
   
    
  }
}
