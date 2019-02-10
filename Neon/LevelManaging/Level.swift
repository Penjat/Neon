//

import Foundation

struct Level{
  let segments :[Segment]
  
  func getNextSegment() -> Segment{
    //TODO get randomly
    return segments[0]
  }
}
