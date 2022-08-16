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
    private var scene: SKScene!
    
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
        
    }

    override var shouldAutorotate: Bool {
        return false
    }
}
