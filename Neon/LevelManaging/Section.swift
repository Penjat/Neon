

import Foundation

extension Section{
  
  func add(segment:Segment){
    segments = segments?.adding(segment) as! NSSet
    
  }
}
