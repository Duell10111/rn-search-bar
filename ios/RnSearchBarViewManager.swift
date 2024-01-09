import React

@objc(RnSearchBarViewManager)
class RnSearchBarViewManager: RCTViewManager {

  override func view() -> (RnSearchBarView) {
    return RnSearchBarView()
  }

  @objc override static func requiresMainQueueSetup() -> Bool {
    return false
  }
}

class RnSearchBarView : UIView, UISearchBarDelegate {
    
    @objc var color: String = "" {
        didSet {
            //self.backgroundColor = hexStringToUIColor(hexColor: color)
        }
    }
    
    func hexStringToUIColor(hexColor: String) -> UIColor {
        let stringScanner = Scanner(string: hexColor)
        
        if(hexColor.hasPrefix("#")) {
            stringScanner.scanLocation = 1
        }
        var color: UInt32 = 0
        stringScanner.scanHexInt32(&color)
        
        let r = CGFloat(Int(color >> 16) & 0x000000FF)
        let g = CGFloat(Int(color >> 8) & 0x000000FF)
        let b = CGFloat(Int(color) & 0x000000FF)
        
        return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1)
    }
    
    var searchController : UISearchContainerViewController
    
    override init(frame: CGRect) {
        let controller = UISearchController(searchResultsController: UIViewController())
        searchController = UISearchContainerViewController(searchController: controller)
        super.init(frame: frame)
        super.backgroundColor = .blue
        addViewControllerAsSubView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        searchController.view.frame = self.frame
    }
    
    override func removeFromSuperview() {
        if(searchController != nil) {
            searchController.willMove(toParent: nil)
            searchController.view.removeFromSuperview()
            searchController.removeFromParent()
        }
        super.removeFromSuperview()
    }
    
    func addViewControllerAsSubView() {
        let window = UIApplication.shared.keyWindow
        window?.rootViewController?.addChild(searchController)
        if let superviewFrame = super.superview?.frame {
            
        }
        searchController.view.frame = self.frame
        searchController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(searchController.view)
        searchController.didMove(toParent: window?.rootViewController)
    }
    
    @objc override func insertReactSubview(_ subview: UIView!, at atIndex: Int) {
        
    }
}
