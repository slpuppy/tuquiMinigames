import SpriteKit
import GameplayKit


class PolishCrystal: SKScene {
    
    var crystals = [Crystal(crystalSprite: SKSpriteNode(imageNamed: "Amethyst"),
                            dirt1Sprite: SKSpriteNode(imageNamed: "AmethystDirt1"),
                            dirt2Sprite: SKSpriteNode(imageNamed: "AmethystDirt2"),
                            position: CGPoint(x: 0, y: 0),
                            spriteName: "Amethyst"),
                    
                    Crystal(crystalSprite: SKSpriteNode(imageNamed: "Diamond"),
                            dirt1Sprite: SKSpriteNode(imageNamed: "DiamondDirt1"),
                            dirt2Sprite: SKSpriteNode(imageNamed: "DiamondDirt2"),
                            position: CGPoint(x: -100, y: 100),
                            spriteName: "Diamond"),
                    
                    Crystal(crystalSprite: SKSpriteNode(imageNamed: "Ruby"),
                            dirt1Sprite: SKSpriteNode(imageNamed: "RubyDirt1"),
                            dirt2Sprite: SKSpriteNode(imageNamed: "RubyDirt2"),
                            position: CGPoint(x: -100, y: -100),
                            spriteName: "Ruby"),
                    
                    Crystal(crystalSprite: SKSpriteNode(imageNamed: "Saphire"),
                            dirt1Sprite: SKSpriteNode(imageNamed: "SaphireDirt1"),
                            dirt2Sprite: SKSpriteNode(imageNamed: "SaphireDirt2"),
                            position: CGPoint(x: 100, y: -100),
                            spriteName: "Saphire"),
                    
                    Crystal(crystalSprite: SKSpriteNode(imageNamed: "Pearl"),
                            dirt1Sprite: SKSpriteNode(imageNamed: "PearlDirt1"),
                            dirt2Sprite: SKSpriteNode(imageNamed: "PearlDirt2"),
                            position: CGPoint(x: 100, y: 100),
                            spriteName: "Pearl") ]
    
    
    private var taskCompleted = false
    
    private var cloth: SKSpriteNode = SKSpriteNode(imageNamed: "Cloth")
    
    private var movingNode: SKSpriteNode?
    
    

    override func didMove(to view: SKView) {
        
        positionCrystals()
        self.cloth.size = CGSize(width: 50, height: 176)
        self.cloth.position = CGPoint(x: 0, y: -300)
        self.cloth.zPosition = 3
        self.addChild(self.cloth)
        
    }
    
    func positionCrystals() {
        
        for crystal in crystals {
            self.addChild(crystal.crystalSprite)
            self.addChild(crystal.dirt1Sprite)
            self.addChild(crystal.dirt2Sprite)
        }
        
    }
    

    
    func checkTaskCompleted() -> Bool {
        for crystal in crystals {
            if !crystal.cleaned {
                print("false")
                return false
            }
        }
        print("true")
        return true
    }
    
    func touchDown(atPoint pos : CGPoint) {
        
        if self.cloth.contains(pos) {
            self.movingNode = self.cloth
        }
    }
    
    func touchMoved(toPoint pos : CGPoint) {

        if self.movingNode != nil {
            self.movingNode?.position = pos
        }
        
        if self.movingNode == self.cloth && !self.taskCompleted {
            
            for i in crystals.indices {
            
                if !crystals[i].dirt1Removed && !crystals[i].cleaned && crystals[i].dirt1Sprite.contains(pos) && crystals[i].eraseEnable {
                    crystals[i].dirt1Sprite.alpha -= 0.2
                    print(crystals[i].dirt1Sprite.alpha)
        
                    if crystals[i].dirt1Sprite.alpha <= 0 {
                        crystals[i].dirt1Removed = true
                        print(crystals[i].dirt1Removed)
                    }
        
                    crystals[i].eraseEnable = false
        
                } else if crystals[i].dirt1Removed && !crystals[i].cleaned && crystals[i].dirt2Sprite.contains(pos) && crystals[i].eraseEnable {
                    crystals[i].dirt2Sprite.alpha -= 0.2
        
                    if crystals[i].dirt2Sprite.alpha <= 0 {
                        crystals[i].dirt2Sprite.removeFromParent()
                        
                        crystals[i].cleaned = true
                        
                        crystals[i].buildShine(scene: self)
                        crystals[i].animateShine()
  
                    }
        
                    crystals[i].eraseEnable = false
        
                } else if !crystals[i].cleaned && !crystals[i].dirt1Sprite.contains(pos) {
                    crystals[i].eraseEnable = true
        
                }
            }
            
            self.taskCompleted = checkTaskCompleted()
 
        }
        
        
        

        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
        if self.movingNode != nil {
            self.cloth.position = CGPoint(x: 0, y: -300)
            self.movingNode = nil
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
