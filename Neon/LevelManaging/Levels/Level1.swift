

import CoreData

extension LevelDatabeaseCreator{
  
  func createLevel1(context:NSManagedObjectContext){
 
    //------------------LEVEL 1------------------------------
    let level = Level.create(context: context ,name:"level 1" ,difficulty: 1 )
    
    
    //---------------section 1-------------------
  
    let section1 = Section.create(context: context, order:0 , distance:500.0,speed:30.0)
    level.add(section: section1)
    
    //----------section 1 segment 1
    let section1_segment1 = Segment.create(context: context , frequency: 50.0 , spacing: 40.0)
    section1.add(segment: section1_segment1)

    section1_segment1.add(piece: Piece.create(context: context ,type: 0 , color: CollectType.Points ,x:0.0 , y:0.0 , width:3.0 , height: 3.0))
    section1_segment1.add(piece: Piece.create(context: context ,type: 0 , color: CollectType.Points ,x:-8.0 , y:0.0 , width:3.0 , height: 3.0))
    section1_segment1.add(piece: Piece.create(context: context ,type: 0 , color: CollectType.Points ,x:8.0 , y:0.0 , width:3.0 , height: 3.0))
    
    section1_segment1.add(piece: Piece.create(context: context ,type: 0 , color: CollectType.DamagePlayer ,x:0.0 , y:8.0 , width:3.0 , height: 3.0))
    section1_segment1.add(piece: Piece.create(context: context ,type: 0 , color: CollectType.DamagePlayer ,x:-8.0 , y:8.0 , width:3.0 , height: 3.0))
    section1_segment1.add(piece: Piece.create(context: context ,type: 0 , color: CollectType.DamagePlayer ,x:8.0 , y:8.0 , width:3.0 , height: 3.0))
    
    section1_segment1.add(piece: Piece.create(context: context ,type: 0 , color: CollectType.Points ,x:0.0 , y:16.0 , width:3.0 , height: 3.0))
    section1_segment1.add(piece: Piece.create(context: context ,type: 0 , color: CollectType.Points ,x:-8.0 , y:16.0 , width:3.0 , height: 3.0))
    section1_segment1.add(piece: Piece.create(context: context ,type: 0 , color: CollectType.Points ,x:8.0 , y:16.0 , width:3.0 , height: 3.0))
    
    //----------section 1 segment 2
    let section1_segment2 = Segment.create(context: context , frequency: 50.0 , spacing: 22.0)
    section1.add(segment: section1_segment2)
    
    section1_segment2.add(piece: Piece.create(context: context ,type: 1 , color: CollectType.DamagePlayer ,x:-8.0 , y:8.0 , width:16.0 , height: 1.0))
    section1_segment2.add(piece: Piece.create(context: context ,type: 1 , color: CollectType.DamagePlayer ,x:8.0 , y:8.0 , width:16.0 , height: 1.0))
    
    //----------section 1 segment 3
    let section1_segment3 = Segment.create(context: context , frequency: 50.0 , spacing: 22.0)
    section1.add(segment: section1_segment3)
    
    section1_segment3.add(piece: Piece.create(context: context ,type: 2 , color: CollectType.DamagePlayer ,x:0 , y:0 , width:5.0 , height: 1.0))
    section1_segment3.add(piece: Piece.create(context: context ,type: 2 , color: CollectType.DamagePlayer ,x:8.0 , y:8.0 , width:5.0 , height: 1.0))
    
    section1_segment3.add(piece: Piece.create(context: context ,type: 0 , color: CollectType.Points ,x:0.0 , y:4.0 , width:3.0 , height: 3.0))
    section1_segment3.add(piece: Piece.create(context: context ,type: 0 , color: CollectType.Points ,x:-8.0 , y:4.0 , width:3.0 , height: 3.0))
    section1_segment3.add(piece: Piece.create(context: context ,type: 0 , color: CollectType.Points ,x:8.0 , y:4.0 , width:3.0 , height: 3.0))
    
    
    //----------section 1 segment 4
    let section1_segment4 = Segment.create(context: context , frequency: 50.0 , spacing: 8.0)
    section1.add(segment: section1_segment3)
    
    section1_segment4.add(piece: Piece.create(context: context ,type: 1 , color: CollectType.DamagePlayer ,x:0 , y:0 , width:5.0 , height: 1.0))
    section1_segment4.add(piece: Piece.create(context: context ,type: 1 , color: CollectType.Points ,x:8.0 , y:0.0 , width:3.0 , height: 3.0))
    section1_segment4.add(piece: Piece.create(context: context ,type: 1 , color: CollectType.Points ,x:-8.0 , y:0.0 , width:3.0 , height: 3.0))
    
    
//    section1_segment1.add(piece: Piece.create(context: context ,type: 0 , color: CollectType.DamagePlayer ,x:2.0 , y:0.0 , width:1.0 , height: 1.0))
    
    
    
    
    //----------------------section 2---------------------
    let section2 = Section.create(context: context, order: 1, distance: 500.0, speed: 30.0)
    level.add(section: section2)
    
    //-----------section2 segment1
    let section2_segment1 = Segment.create(context: context, frequency: 50.0, spacing: 20.0)
    
    section2.add(segment: section2_segment1)

    section2_segment1.add(piece: Piece.create(context: context, type: 0, color: CollectType.DamagePlayer, x: -12, y: 0, width: 7.0, height: 1.0))
    
    section2_segment1.add(piece: Piece.create(context: context, type: 0, color: CollectType.DamagePlayer, x: 12, y: 0, width: 7.0, height: 1.0))
    
    //-----------section2 segment2
    let section2_segment2 = Segment.create(context: context, frequency: 50.0, spacing: 20.0)
    
    section2.add(segment: section2_segment1)
    
    section2_segment2.add(piece: Piece.create(context: context, type: 0, color: CollectType.DamagePlayer, x: -14, y: 0, width: 4.0, height: 1.0))
    
    section2_segment2.add(piece: Piece.create(context: context, type: 0, color: CollectType.DamagePlayer, x: 12, y: 0, width: 8.0, height: 1.0))
    
   
  }
}

