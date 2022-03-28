//
//  MainTabBarController.swift
//  MainTabBar
//
//  Created by Lee on 2022/03/23.
//

import UIKit

class MainTabBarController: UITabBarController {
  
  private let vcA = UINavigationController(rootViewController: AViewController())
  private let vcB = UINavigationController(rootViewController: BViewController())
  private let vcCenter = CenterViewController()
  private let vcC = UINavigationController(rootViewController: CViewController())
  private let vcD = UINavigationController(rootViewController: DViewController())
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    vcA.tabBarItem = UITabBarItem(
      title: "",
      image: UIImage(systemName: "a.square.fill"),
      tag: 0
    )
    
    vcB.tabBarItem = UITabBarItem(
      title: "",
      image: UIImage(systemName: "b.square.fill"),
      tag: 1
    )
    
    vcCenter.tabBarItem = UITabBarItem(
      title: "",
      image: UIImage(systemName: "exclamationmark.square.fill"),
      tag: 2
    )
    
    vcC.tabBarItem = UITabBarItem(
      title: "",
      image: UIImage(systemName: "c.square.fill"),
      tag: 3
    )
    
    vcD.tabBarItem = UITabBarItem(
      title: "",
      image: UIImage(systemName: "d.square.fill"),
      tag: 4
    )
    
    self.delegate = self
    self.viewControllers = [vcA, vcB, vcCenter, vcC, vcD]
  }
}


extension MainTabBarController: UITabBarControllerDelegate {
  func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
    
//    switch viewController is CenterViewController {
//    case true:
//      if let navi = self.viewControllers?[self.selectedIndex] as? UINavigationController,
//         let topVC = navi.topViewController,
//         let vc = topVC as? BaseViewController {
//        vc.isPopup = false
//      }
//
//      return false
//
//    case false:
//      if let navi = self.viewControllers?[self.selectedIndex] as? UINavigationController,
//         let topVC = navi.topViewController,
//         let vc = topVC as? BaseViewController {
//        vc.isPopup = true
//      }
//
//      return true
//    }
    
    let isTempVC = viewController is CenterViewController
    if let navi = self.viewControllers?[self.selectedIndex] as? UINavigationController,
       let topVC = navi.topViewController,
       let vc = topVC as? BaseViewController {
      vc.isPopup = !isTempVC
    }
    return !isTempVC
  }
}
