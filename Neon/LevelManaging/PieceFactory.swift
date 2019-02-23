

import SpriteKit
import CoreData


class PieceFactory{
  
  weak var gameScene :GameScene!
  
  //TODO replace with difficulty range
  var curLevelIndex = 1
  var currentLevelManager :CurrentLevelManager!
  
  
  var isCreating = false
  
  init(gameScene: GameScene) {
    self.gameScene = gameScene
    currentLevelManager = CurrentLevelManager(ratio:gameScene.getRatio())

    getNextLevel()
    
  }
  
  func startCreating(moveingNode:SKNode){
    //start creating pieces for the level
    currentLevelManager.startLevel(movingNodeY: moveingNode.position.y)
    isCreating = true
    
    
  }
  func stopCreating(){

    isCreating = false
  }
  
  
  func checkShouldCreate(moveingNode:SKNode){
    if(!isCreating){
      return
    }
    
    //check moving node's distance and see if it is time to create another segment
    if(moveingNode.position.y < currentLevelManager.distUntilNextSegment){
      //print("time to create another segment")
      createNextSegment(moveingNode: moveingNode)
      
      //check if the section is done
      if currentLevelManager.shouldChangeSection(movingNodeY: moveingNode.position.y) {
        //check if the level is done
        print("sectionChange = \(currentLevelManager.distUntilNextSection) , movingNodeY = \(moveingNode.position.y)")
        
        if currentLevelManager.shouldChangeLevel(movingNodeY: moveingNode.position.y){
          curLevelIndex += 1
          getNextLevel()
          currentLevelManager.startLevel(movingNodeY: moveingNode.position.y)
        }else{
          currentLevelManager.changeSection()
        }
      }
    }
  }
  func getNextLevel(){
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let request: NSFetchRequest<Level> = Level.fetchRequest()
    let context = appDelegate.persistentContainer.viewContext
//    request.predicate = NSPredicate(format: "ANY name == %@", "level \(curLevelIndex)")
    
    if let results = try? context.fetch(request) , results.count > 0{
      for level in results{
        print("level name = \(level.name)")
        if level.name == "level \(curLevelIndex)" {
          currentLevelManager.set(curLevel: level)
          print("found level")
          return
        }
      }
      
    }else{
      print("was unable to load level \(curLevelIndex)")
    }
    
  }
  
  func createNextSegment(moveingNode:SKNode){
    
    
    let pieceArray = currentLevelManager.getPieces()
    for piece in pieceArray{
      gameScene.createPieceNode(piece:piece)
    }
    
    
  }
  func reset(){
    //resets to level 1
    print("reseting level")
    curLevelIndex = 1
    getNextLevel()
  }
  
  
}
