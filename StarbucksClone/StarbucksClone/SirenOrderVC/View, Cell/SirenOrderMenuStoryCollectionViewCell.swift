//
//  SirenOrderMenuStoryCollectionViewCell.swift
//  StarbuckCloneEx2
//
//  Created by Mac mini on 2020/03/08.
//  Copyright © 2020 Mac mini. All rights reserved.
//

import UIKit

class SirenOrderMenuStoryCollectionViewCell: UICollectionViewCell {
  
  static let identifier = "SirenOrderMenuStoryCollectionViewCell"
  
  private let button = UIButton()
  
  override init(frame: CGRect) {
    super .init(frame: frame)
    setupButton()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setupButton() {
    button.contentMode = .scaleAspectFill
    button.clipsToBounds = true
    contentView.addSubview(button)
    button.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      button.topAnchor.constraint(equalTo: self.topAnchor),
      button.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      button.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      button.bottomAnchor.constraint(equalTo: self.bottomAnchor),
    ])
  }
  
  func configure(image: UIImage?){
    button.setImage(image, for: .normal)
  }
    
}
