//
//  ChooseCupButtonLineView.swift
//  StarbuckCloneEx2
//
//  Created by Mac mini on 2020/03/09.
//  Copyright © 2020 Mac mini. All rights reserved.
//

import UIKit

class ChooseCupButtonLineView: UIView {
  
  let lineView = UIView()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setUI()
    setAutoLayout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setUI() {
    lineView.translatesAutoresizingMaskIntoConstraints = false
    self.addSubview(lineView)
    lineView.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
  }
  
  func setAutoLayout() {
    NSLayoutConstraint.activate([
      lineView.topAnchor.constraint(equalTo: self.topAnchor),
      lineView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      lineView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      lineView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
    ])
  }
}
