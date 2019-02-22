

import CoreData

extension LevelDatabeaseCreator{
  
  func createLevel1(context:NSManagedObjectContext){
    
    
    //let level1 = Level(context: context)
    let level1 = Level.create(context: context ,name:"level 1" ,difficulty: 1 )
    
    
    //---------------section 1-------------------
    let section1 = Section.create(context: context, order:0 , distance:500.0,speed:30.0)
    
    level1.add(section: section1)
    
    //create the segment
    let segment1 = Segment.create(context: context , frequency: 50.0 , spacing: 20.0)
    section1.add(segment: segment1)
    
    
    //create the pieces
    let piece1 = Piece.create(context: context ,type: 0 , color: CollectType.Points ,x:-2.0 , y:0.0 , width:1.0 , height: 1.0)
   
    segment1.add(piece: piece1)
    
    let piece2 = Piece(context: context)
    piece2.type = 0
    piece2.color = 0
    piece2.x = 2.0
    piece2.y = 0.0
    piece2.width = 1.0
    piece2.height = 1.0
    piece2.isRandom = false
    segment1.add(piece: piece2)
    
    //----------------------section 2---------------------
    let section2 = Section(context: context)
    section2.speed = 30.0
    section2.distance = 500.0
    section2.orderId = 1
    //section2.segments = [segment2]
    level1.add(section: section2)
    
    //create the segment
    let segment2 = Segment(context: context)
    segment2.frequency = 50.0
    segment2.spacing = 20.0
    //segment2.pieces = [piece3,piece4]
    section2.add(segment: segment2)
    
    //create the pieces
    let piece3 = Piece(context: context)
    piece3.type = 0
    piece3.color = 1
    piece3.x = -4.0
    piece3.y = 0.0
    piece3.width = 1.0
    piece3.height = 1.0
    piece3.isRandom = false
    segment2.add(piece: piece3)
    
    let piece4 = Piece(context: context)
    piece4.type = 0
    piece4.color = 1
    piece4.x = 3.0
    piece4.y = 0.0
    piece4.width = 2.0
    piece4.height = 2.0
    piece4.isRandom = false
    segment2.add(piece: piece4)
    
   
  }
}

