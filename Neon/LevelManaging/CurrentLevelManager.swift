

import CoreData
import SpriteKit



class CurrentLevelManager{
  //manages all the functions that deal with getting data from the current level
  //informs the piece factory when it is time to get a new level
  
  private var curLevel :Level!
  
  var curSectionIndex = 0
  var sectionArray :[Section]!
  var segmentArray :[Segment]!
  
  var distUntilNextSegment :CGFloat = 0.0
  var distUntilNextSection :CGFloat = 0.0
  
  func set(curLevel:Level){
    
    //starting a new level
    self.curLevel = curLevel
    curSectionIndex = 0
    
    sectionArray =  (curLevel.sections?.allObjects as! [Section])
    segmentArray = (sectionArray[0].segments!.allObjects as! [Segment])
    
  }
  
  func startLevel(movingNodeY:CGFloat){
    print("starting level")
    distUntilNextSection -= CGFloat(sectionArray[0].distance*10)
    distUntilNextSegment = movingNodeY-200
    print("distSeg = \(distUntilNextSegment)")
  }
  
  
  func getPieces()-> [Piece]{
    
    let segment = segmentArray.randomElement()
    distUntilNextSegment -= CGFloat(segment!.spacing*10)
    
    return segment!.pieces!.allObjects as! [Piece]
    
  }
  func shouldChangeSection(movingNodeY:CGFloat) -> Bool{
    if movingNodeY < distUntilNextSection {
      return true
    }
    return false
    
  }
  func shouldChangeLevel(movingNodeY:CGFloat) -> Bool{
    //is called asuming the current section is finnished
    if curSectionIndex >= sectionArray.count - 1 {
      return true
    }
    return false
  }
  
  func changeSection(){
    //TODO check if needs to update level
    
    curSectionIndex += 1
    let index = curSectionIndex%sectionArray.count
    segmentArray = (sectionArray[index].segments!.allObjects as! [Segment])
    distUntilNextSection -= CGFloat(sectionArray[index].distance*10)
    
  }
}
