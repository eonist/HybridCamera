import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
   var window: UIWindow?
   func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
      self.window = {
         let window = UIWindow(frame: UIScreen.main.bounds)
         let vc = VC()
         window.rootViewController = vc
         window.makeKeyAndVisible()/*since we have no Main storyboard*/
         return window
      }()
      return true
   }
   /**
    * Boilerplate
    */
   func applicationWillResignActive(_ application: UIApplication) {}
   func applicationDidEnterBackground(_ application: UIApplication) { }
   func applicationWillEnterForeground(_ application: UIApplication) { }
   func applicationDidBecomeActive(_ application: UIApplication) { }
   func applicationWillTerminate(_ application: UIApplication) { }
}
//class Temp:UIView{
//
//}


//      Swift.print("")
//      let temp = Wrapper()
//      temp.test()

//extension Temp {
//   /**
//    *
//    */
//   @objc func test(){
//      Swift.print("test")
//   }
//}
//class Wrapper:Temp{
//    override func test() {
//      Swift.print("wrapper.test")
//   }
//}
