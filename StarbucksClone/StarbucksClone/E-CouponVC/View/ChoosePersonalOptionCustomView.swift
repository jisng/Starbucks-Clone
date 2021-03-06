//
//  ChoosePersonalOptionCustomView.swift
//  StarbuckCloneEx2
//
//  Created by Mac mini on 2020/03/09.
//  Copyright © 2020 Mac mini. All rights reserved.
//

import UIKit

class ChoosePersonalOptionCustomView: UIView {
  
  let titleLabel = UILabel()
  let lineLabel = UILabel()
  let imageView = UIImageView()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setUI()
    setAutoLayout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setUI() {
    [titleLabel, lineLabel, imageView].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      self.addSubview($0)
    }
    
    titleLabel.text = "퍼스널 옵션"
    titleLabel.textColor = .black
    titleLabel.font = UIFont.systemFont(ofSize: 12)
    lineLabel.text = "| "
    lineLabel.textColor = .lightGray
    imageView.image = UIImage(systemName: "chevron.right")
    imageView.tintColor = .darkGray
    self.backgroundColor = .clear
    self.layer.borderWidth = 1
    self.layer.borderColor = UIColor.lightGray.cgColor
    self.layer.cornerRadius = 2
  }
  
  func setAutoLayout() {
    let margin:CGFloat = 10
    
    NSLayoutConstraint.activate([
      titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
      titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: margin),
      
      imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -margin),
      imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
      
      lineLabel.trailingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: -margin),
      lineLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
    ])
  }
}
