

import CoreData

extension LevelDatabeaseCreator{
  
  func createLevel1(context:NSManagedObjectContext){
 
    //------------------LEVEL 1------------------------------
    let level = Level.create(context: context ,name:"level 1" ,difficulty: 1 )
    
    
    //---------------section 1-------------------
  
    let section1 = Section.create(context: context, order:0 , distance:500.0,speed:30.0)
    level.add(section: section1)
    
    //----------section 1 segment 1
    let section1_segment1 = Segment.create(context: context , frequency: 50.0 , spacing: 5.0)
    section1.add(segment: section1_segment1)

    section1_segment1.add(piece: Piece.create(context: context ,type: 0 , color: CollectType.Points ,x:0.0 , y:0.0 , width:4.0 , height: 1.0))
    
//    section1_segment1.add(piece: Piece.create(context: context ,type: 0 , color: CollectType.DamagePlayer ,x:2.0 , y:0.0 , width:1.0 , height: 1.0))
    
    
    
    
    //----------------------section 2---------------------
    let section2 = Section.create(context: context, order: 1, distance: 500.0, speed: 30.0)
    level.add(section: section2)
    
    //-----------section2 segment1
    let section2_segment1 = Segment.create(context: context, frequency: 50.0, spacing: 20.0)
    
    section2.add(segment: section2_segment1)

    section2_segment1.add(piece: Piece.create(context: context, type: 0, color: CollectType.Points, x: -4, y: 0, width: 2.0, height: 2.0))
    
    section2_segment1.add(piece: Piece.create(context: context, type: 0, color: CollectType.Points, x: 0, y: 1, width: 2.0, height: 2.0))
    
   
  }
}

