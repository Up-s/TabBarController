//
//  BaseViewController.swift
//  MainTabBar
//
//  Created by Lee on 2022/03/23.
//

import UIKit

class BaseViewController: UIViewController {
  
  private let popupView = PopupView()
  
  var isPopup: Bool = true {
    didSet {
      self.popupView.animationPopup(isPopup)
    }
  }
  
  override func loadView() {
    self.view = self.popupView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
}
