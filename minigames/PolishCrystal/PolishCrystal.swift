import SpriteKit
import GameplayKit

class PolishCrystal: SKScene {
    
    private var eraseEnable = false
    private var crystal : SKShapeNode = SKShapeNode(rectOf: CGSize(width: 400, height: 400))
    private var dirt: SKShapeNode = SKShapeNode(circleOfRadius: 50)
    private var cloth: SKShapeNode = SKShapeNode(ellipseOf: CGSize(width: 50, height: 30))
    
    private var node: SKShapeNode?

    
    override func didMove(to view: SKView) {
        
        self.crystal.fillColor = .red
        self.addChild(self.crystal)
        
        self.dirt.fillColor = .blue
        self.addChild(self.dirt)
        
        self.cloth.fillColor = .green
        self.cloth.position = CGPoint(x: 0, y: -300)
        self.addChild(self.cloth)
        
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        
        if self.cloth.contains(pos) {
            self.node = self.cloth
        }
    }
    
    func touchMoved(toPoint pos : CGPoint) {

        if self.node != nil {
            self.node?.position = pos
        }
        
        if self.node == self.cloth && self.dirt.contains(pos) && eraseEnable {
            self.dirt.alpha -= 0.2
            
            print("alpha: \(self.dirt.alpha)")
            eraseEnable = false

        } else if self.node == self.cloth && !self.dirt.contains(pos) {
            eraseEnable = true
            
        }
        print("erase: \(eraseEnable)")
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
        if self.node != nil {
            self.node = nil
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
