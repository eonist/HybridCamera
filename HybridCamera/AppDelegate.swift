import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
   var window: UIWindow?
   internal func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      self.window = {
         let window = UIWindow(frame: UIScreen.main.bounds)
         let vc = ViewController()
         window.rootViewController = vc
         window.makeKeyAndVisible() // since we have no Main storyboard
         return window
      }()
      return true
   }
}
