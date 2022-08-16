//
//  Crystal.swift
//  minigames
//
//  Created by Gabriel Puppi on 15/08/22.
//

import Foundation
import UIKit
import SpriteKit

class Crystal {
    
    var eraseEnable: Bool = false
    var dirt1Removed: Bool = false
    var cleaned: Bool = false
    var crystalSprite: SKSpriteNode
    var dirt1Sprite: SKSpriteNode
    var dirt2Sprite: SKSpriteNode
    var position: CGPoint
    var spriteName: String
    
    var shine = SKSpriteNode()
    var shineFrames: [SKTexture] = []
    
    init(crystalSprite: SKSpriteNode, dirt1Sprite: SKSpriteNode, dirt2Sprite: SKSpriteNode, position: CGPoint, spriteName: String) {
        
        self.crystalSprite = crystalSprite
        self.dirt1Sprite = dirt1Sprite
        self.dirt2Sprite = dirt2Sprite
        self.position = position
        self.spriteName = spriteName
        
        self.crystalSprite.position = self.position
        self.crystalSprite.name = self.spriteName
        
        self.dirt1Sprite.zPosition = 2
        self.dirt1Sprite.alpha = 1
        self.dirt1Sprite.position = self.position
        
        self.dirt2Sprite.zPosition = 1
        self.dirt2Sprite.alpha = 1
        self.dirt2Sprite.position = self.position
        
    }
    
    func buildShine(scene: SKScene) {
        let shineAnimatedAtlas = SKTextureAtlas(named: spriteName+"Shine")
        var frames: [SKTexture] = []
        
        let numImages = shineAnimatedAtlas.textureNames.count
        for i in 1...numImages {
            let shineTextureName = spriteName+"Shine\(i)"
            frames.append(shineAnimatedAtlas.textureNamed(shineTextureName))
        }
    
        
        shineFrames = frames
     
        let firstFrameTexture = shineFrames[0]
        shine = SKSpriteNode(texture: firstFrameTexture)
        shine.position = self.crystalSprite.position
        shine.zPosition = 1
        scene.addChild(shine)
    }
    
    func animateShine() {
      shine.run(SKAction.repeatForever(
        SKAction.animate(with: shineFrames,
                         timePerFrame: 0.2,
                         resize: false,
                         restore: true)),
        withKey:"shine")
    }
    
    
    
}
