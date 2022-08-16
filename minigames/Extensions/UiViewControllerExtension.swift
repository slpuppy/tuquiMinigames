import UIKit
import SpriteKit

extension UIViewController {
    func openScene(scene: SKScene?) {
        self.view = SKView()
        self.view.bounds = UIScreen.main.bounds
        
        if let view = self.view as? SKView {
            if let scene = scene {
                scene.size = CGSize(width: 750, height: 1334)
                scene.anchorPoint = CGPoint(x: 0.5, y: 0.5)
                view.presentScene(scene)
            }
        }
    }
}

