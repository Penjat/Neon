

import SpriteKit

extension GameScene {
  
  func createPieceNode(piece:Piece){
    
    
    
    let pieceNode = getPieceNode(piece:piece)
    movingNode.addChild(pieceNode)
    pieceArray.append(pieceNode)
  }
  
  func getPieceNode(piece:Piece) -> PieceNode{
    switch(piece.type){
    case 0:
      return CoinPiece(piece: piece, scene: self)
    case 1:
      return SpinningPiece(piece: piece, scene: self)
    case 2:
      return ForthBackPiece(piece: piece, scene: self)
    case 3:
      return DiamondPiece(piece: piece, scene: self)
    default:
      return CoinPiece(piece: piece, scene: self)
    }
  }
}
