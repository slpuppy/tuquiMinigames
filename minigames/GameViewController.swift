//
//  GameViewController.swift
//  minigames
//
//  Created by Alessandra Fernandes Lacerda on 10/05/22.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    private let skScene = PolishCrystal()
    var skView: SKView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        let view = SKView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height))
        skView = view
        skView.backgroundColor = .red
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
