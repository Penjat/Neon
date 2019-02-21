

import Foundation

extension Section{
  
  func add(segment:Segment){
    print("adding segment")
    segments = segments?.adding(segment) as! NSSet
    
  }
}
