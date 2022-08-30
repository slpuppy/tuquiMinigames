import UIKit
import SnapKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let gameViewController = GameSelectViewController()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = gameViewController
        window?.makeKeyAndVisible()
        
        return true
    }
}

