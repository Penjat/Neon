

import CoreData

extension Segment{
  
  class func create(context:NSManagedObjectContext , frequency:Float , spacing:Float  ) -> Segment{
    
    
    let segment = NSEntityDescription.insertNewObject(forEntityName: "Segment", into: context) as! Segment
    
    
    segment.frequency = frequency
    segment.spacing = spacing
  
    return segment
  }
  
  func add(piece:Piece){
    pieces = pieces?.adding(piece) as! NSSet
  }
}
