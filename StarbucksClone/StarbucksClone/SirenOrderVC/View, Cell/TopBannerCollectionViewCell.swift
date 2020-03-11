//
//  TopBannerCollectionViewCell.swift
//  StarbuckCloneEx2
//
//  Created by Mac mini on 2020/03/07.
//  Copyright © 2020 Mac mini. All rights reserved.
//

import UIKit

class TopBannerCollectionViewCell: UICollectionViewCell {
  static let identifier = "TopBannerCollectionViewCell"
    
    private let imageView = UIImageView()
    
    override init(frame: CGRect) {
      super .init(frame: frame)
      setAutoLayout()
    }
    
    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    func setAutoLayout() {
      contentView.addSubview(imageView)
      imageView.translatesAutoresizingMaskIntoConstraints = false
      imageView.contentMode = .scaleAspectFill
      imageView.clipsToBounds = true
      
      NSLayoutConstraint.activate([
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
        imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
        imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
      ])
    }
    
    func configure(image: UIImage?) {
      imageView.image = image
    }
    
}
