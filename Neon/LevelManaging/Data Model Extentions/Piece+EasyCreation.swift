

import CoreData

extension Piece{
  
  class func create(context:NSManagedObjectContext , type:Int ,color:CollectType , x:Float , y:Float ,width:Float ,height:Float , isRand:Bool = false  ) -> Piece{
    
    
    let piece = NSEntityDescription.insertNewObject(forEntityName: "Piece", into: context) as! Piece
    
    piece.type = Int16(type)
    piece.color = color.asInt()
    piece.x = x
    piece.y = y
    piece.width = width
    piece.height = height
    piece.isRandom = isRand
    
    return piece
  }
  
  
  
}
