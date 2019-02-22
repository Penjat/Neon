

import SpriteKit

extension GameScene {
  
  func createPieceNode(piece:Piece){
    
    
    
    let pieceNode = DiamondPiece(piece: piece)
    pieceNode.setUp()
    //TODO pass this through init
    
    //    let piecePosition = CGPoint(x: piece.position.x, y: piece.position.y - mainNode.position.y + frame.height/2)
    
    //TODO set values with piece
    let x = CGFloat(piece.x)
    let y = CGFloat(piece.y)
    let width = CGFloat(piece.width)
    let height = CGFloat(piece.height)
    let piecePosition = getPositionForScreen(position: CGPoint(x:x,y:y) )
    pieceNode.position = piecePosition
    pieceNode.size = getSizeForScreen(size: CGSize(width:width,height:height))
    movingNode.addChild(pieceNode)
    
    pieceNode.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 40, height: 40))
    pieceNode.physicsBody?.collisionBitMask = 0
    pieceNode.physicsBody?.contactTestBitMask = 1
    pieceNode.physicsBody?.categoryBitMask = PIECE_CATAGORY
    pieceNode.physicsBody?.isDynamic = true
    
    pieceArray.append(pieceNode)
  }
}
