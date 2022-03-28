//
//  AppDelegate.swift
//  MainTabBar
//
//  Created by Lee on 2022/03/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    self.window = UIWindow(frame: UIScreen.main.bounds)
    self.window?.rootViewController = MainTabBarController()
    self.window?.makeKeyAndVisible()
    
    return true
  }
}

