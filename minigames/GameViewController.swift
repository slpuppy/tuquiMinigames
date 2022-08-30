import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    private var scene: SKScene!
    
    private lazy var closeButton: UIButton = {
        let button = UIButton()
        let systemIconConfiguration = UIImage.SymbolConfiguration(pointSize: 24, weight: .black)
        button.setImage(UIImage(systemName: "x.circle.fill", withConfiguration: systemIconConfiguration), for: .normal)
        button.addTarget(self, action: #selector(dimissView), for: .touchUpInside)
        button.tintColor = UIColor(red: 255/255, green: 240/255, blue: 211/255, alpha: 1)
        
        return button
    }()
    
    init(scene: SKScene) {
        self.scene = scene
        scene.scaleMode = .aspectFill
        super.init(nibName: nil, bundle: nil)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        openScene(scene: scene)
        addButton()
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    func addButton() {
        closeButton.translatesAutoresizingMaskIntoConstraints = true
        view.addSubview(closeButton)
        
        closeButton.snp.makeConstraints {
            $0.top.equalTo(view.snp_topMargin).offset(20)
            $0.right.equalTo(view.snp_rightMargin).offset(-20)
        }
    }
    
    @objc
    func dimissView() {
        #warning("TODO: Need to change navigation")
        self.dismiss(animated: true)
    }
}
