//
//  SceneDelegate.swift
//  test
//
//  Created by Nicolas Le Gorrec on 6/3/21.
//

import UIKit

// The SceneDelegate is responsible for what's
// shown on the screen; the scenes or windows
// This must be marked with iOS13 since SceneDelegate only works for ios 13
@available(iOS 13, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {}
    
    func sceneDidBecomeActive(_ scene: UIScene) {}
    
    func sceneWillResignActive(_ scene: UIScene) {}
    
    func sceneDidEnterBackground(_ scene: UIScene) {}
    
    func sceneDidDisconnect(_ scene: UIScene) {}
}

