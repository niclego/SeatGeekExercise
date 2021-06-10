//
//  AppDelegate.swift
//  test
//
//  Created by Nicolas Le Gorrec on 6/3/21.
//

import UIKit

// The AppDelegate is the main point of entry, for both <iOS12 and >=iOS13. The AppDelegate is the object that's responsible for your application's lifecycle.
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    // This must be here for iOS12
    var window: UIWindow?
    
    // This method is called when the application is just launched. This method is used to perform application setup.
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }
    
    // This method is called whenever your application is expected to supply a new scene,
    // or window for iOS to display.
    @available(iOS 13, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    // This method is called whenever a user discards a scene, for example by swiping it away in
    // the multitasking window or if you do so programmatically.
    @available(iOS 13, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        
    }

    //Inaddition to these methods, AppDelegate can still handle the external services like push notification registrations, location services, app termination and more.
}

