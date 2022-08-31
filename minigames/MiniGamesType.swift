import UIKit
import SpriteKit

enum MiniGameType {
    case polyshCrystal, maze
    
    var assetImage: UIImage {
        switch self {
        case .polyshCrystal:
            return UIImage(named: "polyshAsset") ?? UIImage()
        case .maze:
            return UIImage(named: "mazeAsset") ?? UIImage()
        }
    }
    
    var name: String {
        switch self {
        case .polyshCrystal:
            return "Clean the Gems"
        case .maze:
            return "Out of lab"
        }
    }
    
    var gameDescription: String {
#warning("TODO: Need real descriptions here")
        switch self {
        case .polyshCrystal:
            return "Os cristal são a base energética essencial para cada um dos grupos produzirem seus feitiços e poções."
        case .maze:
            return "Os cristal são a base energética essencial para cada um dos grupos produzirem seus feitiços e poções."
        }
    }
    
    var background: UIColor {
        switch self {
#warning("TODO: Need real colors or a lovely backgroud here")
        case .polyshCrystal:
            return UIColor(red: 109/255, green: 84/255, blue: 66/255, alpha: 1)
        case .maze:
            return UIColor(red: 18/255, green: 150/255, blue: 191/255, alpha: 1)
        }
    }
    
    var scene: SKScene {
        switch self {
        case .polyshCrystal:
            return PolishCrystal()
        case .maze:
            return MazeScene()
        }
    }
}
