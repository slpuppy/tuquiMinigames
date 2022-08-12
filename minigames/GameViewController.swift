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
    var scene: PolishCrystal!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scene = PolishCrystal()
        openScene(scene: scene)
    }

    override var shouldAutorotate: Bool {
        return false
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
}
