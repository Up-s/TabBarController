//
//  PopupView.swift
//  MainTabBar
//
//  Created by Lee on 2022/03/23.
//

import UIKit

class PopupView: UIView {
  
  private let contentView = UIView()
  
  private var bottomConstraint: NSLayoutConstraint?
  
  // MARK: - Life Cycle
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    self.setAttribute()
    self.setConstraint()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func animationPopup(_ position: Bool) {
    let duration: CGFloat = position ? 0.0 : 0.2
    let alpha: CGFloat = position ? 0.0 : 1.0
    let constant: CGFloat = position ? 40.0 : 0
    
    UIView.animate(
      withDuration: duration,
      delay: 0,
      animations: { [weak self] in
        self?.contentView.alpha = alpha
        self?.bottomConstraint?.constant = constant
        self?.layoutIfNeeded()
      })
  }
}



// MARK: - UI

extension PopupView {
  
  private func setAttribute() {
    self.backgroundColor = .black.withAlphaComponent(0.2)
    
    self.contentView.alpha = 0
    self.contentView.backgroundColor = .white
    self.contentView.layer.cornerRadius = 16
    self.contentView.layer.masksToBounds = true
    self.contentView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    self.addSubview(self.contentView)
  }
  
  private func setConstraint() {
    let guide = self.safeAreaLayoutGuide
    contentView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      contentView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
      contentView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
      contentView.heightAnchor.constraint(equalToConstant: 400)
    ])
    self.bottomConstraint = contentView.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: 40)
    self.bottomConstraint?.isActive = true
  }
}
