

import CoreData

extension Level{
  
  class func create(context:NSManagedObjectContext , name:String , difficulty:Int , background:Int = 0 , music:Int = 0 , direction:Int = 0) -> Level{
    let level = NSEntityDescription.insertNewObject(forEntityName: "Level", into: context) as! Level
    
    level.name = name
    level.difficulty = Int16(difficulty)
    level.music = Int16(music)
    level.background = Int16(background)
    level.direction = Int16(direction)
    
    return level
  }
  func add(section:Section){
    print("adding section")
    sections = sections?.adding(section) as! NSSet
  }
}
