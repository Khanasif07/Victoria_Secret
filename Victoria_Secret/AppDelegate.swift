//
//  AppDelegate.swift
//  Victoria_Secret
//
//  Created by Admin on 24/01/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    public var window: UIWindow?
    static var shared: AppDelegate {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            return appDelegate
        }
        fatalError("invalid access of AppDelegate")
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame:UIScreen.main.bounds)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 12.5)], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 15.0)], for: .selected)
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

