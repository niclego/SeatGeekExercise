import UIKit
@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window : UIWindow?
    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            self.window = UIWindow(windowScene: windowScene)
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let rootVC = storyboard.instantiateViewController(identifier: "NavigationViewController") as? UINavigationController else {      print("ViewController not found")
                return
            }
            
            self.window!.rootViewController = rootVC
            self.window!.makeKeyAndVisible()
            self.window!.backgroundColor = .red
        }
    }
}
