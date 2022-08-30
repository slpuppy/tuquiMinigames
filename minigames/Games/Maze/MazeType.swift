import SpriteKit

extension MazeScene {
    enum MazeType {
        case easy, medium, hard, test
        
        var difficult: CGSize {
            switch self {
            case .test:
                return CGSize(width: 9/2.3, height: 19/2.3)
            case .easy:
                return CGSize(width: 9/1.2, height: 19/1.2)
            case .medium:
                return CGSize(width: 9/1.1, height: 19/1.1)
            case .hard:
                return CGSize(width: 9/1.05, height: 19/1.05)
            }
        }
    }
}
