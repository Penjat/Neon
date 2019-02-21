

import CoreData


class LevelDatabeaseCreator{

  func setUpLevels(appDelegate:AppDelegate){
    print("setting up levels")
    //TODO check if created rather than bypass
    //deleteData(appDelegate: appDelegate)
    //return
    if checkLevelsInstalled(appDelegate: appDelegate){
      return
    }
    
    let context = appDelegate.persistentContainer.viewContext
    
    let gameInfo = GameInfo(context: context)
    gameInfo.levels_installed = true
    
    createLevel1(context: context)
    createLevel2(context: context)
    

    
    
    
    
    appDelegate.saveContext()
    
    
    
  }
  
  func checkLevelsInstalled(appDelegate:AppDelegate) -> Bool{
    //returns false if levels installed
    
    print("checking if levels installed")
    
    let request: NSFetchRequest<GameInfo> = GameInfo.fetchRequest()
    let context = appDelegate.persistentContainer.viewContext
    //    request.predicate = NSPredicate(format: "ANY name == %@", "level \(curLevelIndex)")
    
    if let results = try? context.fetch(request) , results.count > 0{
      print("levels already installed")
      return true
    }
    
    print("no gamedata found, should install levels")
    return false
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
