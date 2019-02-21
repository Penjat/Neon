

import CoreData

extension Level{
  class func create(context:NSManagedObjectContext) -> Level{
    let level = NSEntityDescription.insertNewObject(forEntityName: "Level", into: context) as! Level
    
    return level
  }
  func add(section:Section){
    print("adding section")
    sections = sections?.adding(section) as! NSSet
  }
}
