//
//  ChooseCupButtonView.swift
//  StarbuckCloneEx2
//
//  Created by Mac mini on 2020/03/09.
//  Copyright © 2020 Mac mini. All rights reserved.
//

import UIKit

class ChooseCupButtonView: UIView {
  
  let buttonView = UIView()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setUI()
    setAutoLayout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setUI() {
    buttonView.translatesAutoresizingMaskIntoConstraints = false
    self.addSubview(buttonView)
    
    buttonView.backgroundColor = .clear
    buttonView.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    buttonView.layer.borderWidth = 1
    buttonView.layer.cornerRadius = 2
  }
  
  func setAutoLayout() {
    
    NSLayoutConstraint.activate([
      buttonView.topAnchor.constraint(equalTo: self.topAnchor),
      buttonView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      buttonView.widthAnchor.constraint(equalTo: self.widthAnchor),
      buttonView.heightAnchor.constraint(equalTo: self.heightAnchor),
    ])
    
  }
  
}
