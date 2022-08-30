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
    
    var randomPositions = [CGPoint(x: 50, y: -30),
                           CGPoint(x: 200, y: -100),
                           CGPoint(x: -100, y: -200),
                           CGPoint(x: 150, y: -280),
                           CGPoint(x: 100, y: -350),
                           CGPoint(x: -200, y: -420),
                           CGPoint(x: -50, y: -90),
                           CGPoint(x: 0, y: -500),
                           CGPoint(x: -260, y: -550),
                           CGPoint(x: -150, y: -240),]

    
    
    private var taskCompleted = false
    
    private var cloth: SKSpriteNode = SKSpriteNode(imageNamed: "Cloth")
    
    private var gameBackground: SKSpriteNode = SKSpriteNode(imageNamed: "background")
    
    private var gameTitle: SKSpriteNode = SKSpriteNode(imageNamed: "minigame1title")
    
    private var gameCompleted: SKSpriteNode = SKSpriteNode(imageNamed: "")
    
    private var tooltipManager: TooltipManager!
    
    private var movingNode: SKSpriteNode?
    
    override func didMove(to view: SKView) {
        
        positionCrystals()
        setupGameTitle()
        tooltipManager = TooltipManager(scene: self,
                                        startPosition: CGPoint(x: -20, y: 250),
                                        timeBetweenAnimations: 1,
                                        animationType: .custom)
        
        tooltipManager.buildCustomAction(positions:[
        CGPoint(x: 20, y: 250),
        CGPoint(x: -20, y: 250),
        CGPoint(x: 20, y: 250),
        ], timeBetweenPositions: 0.5)
        
        tooltipManager.startAnimation()
        
        
        self.cloth.size = CGSize(width: 50, height: 176)
        self.cloth.position = CGPoint(x: 0, y: 175)
        self.cloth.zPosition = 3
        self.gameBackground.zPosition = -1
        self.gameBackground.position = CGPoint(x: 0, y: 0)
        self.gameBackground.setScale(1.8)
        self.addChild(self.gameBackground)
        self.addChild(self.cloth)
        
    }
    
    func placeAtRandomPoint(sprite: Crystal) {
       
       let crystal = sprite.crystalSprite
        let dirt = sprite.dirt1Sprite
        let dirt2 = sprite.dirt2Sprite
        randomPositions.shuffle()
        if let randomPosition = randomPositions.first {
            crystal.position = randomPosition
            dirt.position = crystal.position
            dirt2.position = crystal.position
            self.addChild(crystal)
            self.addChild(dirt)
            self.addChild(dirt2)
            randomPositions.removeFirst()
        }
      
    }
    
    func alignCrystalsAtEnd(sprite: Crystal) {
        for crystal in crystals {
            let move = SKAction.moveTo(y: 50, duration: 0.5)
            crystal.crystalSprite.run(move)
        }
   }
    

    
    func positionCrystals() {
        
        for crystal in crystals {
            placeAtRandomPoint(sprite: crystal)
        }
        
    }
    
    func setupTaskCompleted() {
        if taskCompleted {
            cloth.run(.fadeOut(withDuration: 0.3))
            gameTitle.run(.fadeOut(withDuration: 0.3))
            
            
            
            
            
        }
    }
    
    
    
    
    func setupGameTitle() {
        gameTitle.position = CGPoint(x: 0, y: 390)
        gameTitle.setScale(1.6)
        gameTitle.zPosition = 10
        gameTitle.alpha = 0
        gameTitle.run(.fadeIn(withDuration: 1.2))
        self.addChild(gameTitle)
    }
    
    func triggerNFC(){
        let completed = checkTaskCompleted()
        if completed == true {
            
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
        
        tooltipManager.stopAnimation()
        
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
        
        print(self.cloth.position)
        

        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
        if self.movingNode != nil {
            self.cloth.position = CGPoint(x: 0, y: 175)
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
        setupTaskCompleted()
    }
}
