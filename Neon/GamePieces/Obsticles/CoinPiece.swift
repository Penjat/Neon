

import SpriteKit

class CoinPiece:PieceNode{
  
  override func setUp(piece: Piece, scene: GameScene) {
    super.setUp(piece: piece, scene: scene)
    points = 10
  }
}
