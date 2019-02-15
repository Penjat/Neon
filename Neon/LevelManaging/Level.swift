//

import Foundation

struct Level{
  let segments :[Segment]
  
  func getNextSegment() -> Segment{
    //get a random segment
    let randomIndex = Int.random(in: 0..<segments.count)
    return segments[randomIndex]
  }
}
