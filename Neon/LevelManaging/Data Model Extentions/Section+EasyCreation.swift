

import CoreData

extension Section{
  
  class func create(context:NSManagedObjectContext , order:Int , distance:Float , speed:Float ) -> Section{
    let section = NSEntityDescription.insertNewObject(forEntityName: "Section", into: context) as! Section
    
    
    section.orderId = Int16(order)
    section.speed = speed
    section.distance = distance
    
    
    return section
  }
  
  
  
  func add(segment:Segment){
    print("adding segment")
    segments = segments?.adding(segment) as! NSSet
    
  }
}
