

import Foundation

extension Segment{
  func add(piece:Piece){
    pieces = pieces?.adding(piece) as! NSSet
  }
}
