

import Foundation

extension Level{
  
  func add(section:Section){
    print("adding section")
    sections = sections?.adding(section) as! NSSet
  }
}
