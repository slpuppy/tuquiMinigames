//
//  SceneOpening.swift
//  minigames
//
//  Created by Eros Maurilio on 09/08/22.
//

import Foundation
import SpriteKit

final class SceneOpening {
    
    private var scene: SKScene?
    private var view: UIView?
    static let sharedInstance = SceneOpening()
    
    private init() {}
    
    func openScene(scene: SKScene?, view: UIView) {
        if let view = view as? SKView {
            if let scene = scene {
                scene.scaleMode = .aspectFill
                view.presentScene(scene)
                view.ignoresSiblingOrder = true
                view.showsFPS = true
                view.showsNodeCount = true
            }
        }
    }
}
