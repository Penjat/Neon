

import UIKit

class TitleMenuView: UIView {

  @IBOutlet var contentView: UIView!
  
  var delegate :TitleDelegate?
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    commonInit()
  }
  
  private func commonInit(){
    Bundle.main.loadNibNamed("titleMenu", owner: self, options: nil)
    addSubview(contentView)
    contentView.frame = self.bounds
    contentView.autoresizingMask = [.flexibleWidth , .flexibleHeight]
    
  }
  @IBAction func pressedStart(_ sender: Any) {
    if let delegate = delegate {
      delegate.startGame()
    }
  }
  
}
protocol TitleDelegate {
  
  //TODO pass in more paramaters
  func startGame()
}
