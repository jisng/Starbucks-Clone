//
//  SirenOrderCollectionViewCell.swift
//  StarbuckCloneEx2
//
//  Created by Mac mini on 2020/03/08.
//  Copyright © 2020 Mac mini. All rights reserved.
//

import UIKit

class SirenOrderCollectionViewCell: UICollectionViewCell {
  static let identifier = "SirenOrderCollectionViewCell"
    
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    
    override init(frame: CGRect) {
      super .init(frame: frame)
      setupViews()
      setupConstraints()
      print("contentViewFrameSize:",contentView.frame.size)
    }
    
    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
  //    clipsToBounds = true
  //    layer.cornerRadius = 50
      
      imageView.contentMode = .scaleAspectFit
      imageView.layer.cornerRadius = 50
      imageView.clipsToBounds = true
      contentView.addSubview(imageView)
      
      titleLabel.textAlignment = .center
      titleLabel.textColor = .black
      titleLabel.font = UIFont.systemFont(ofSize: 12)
      titleLabel.numberOfLines = 2
      contentView.addSubview(titleLabel)
    }
    
    private func  setupConstraints() {
      [imageView, titleLabel].forEach {
        $0.translatesAutoresizingMaskIntoConstraints = false
      }
      NSLayoutConstraint.activate([
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
        imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
        imageView.widthAnchor.constraint(equalToConstant: 100),
        imageView.heightAnchor.constraint(equalToConstant: 100),
        
        titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor),
        titleLabel.widthAnchor.constraint(equalTo: imageView.widthAnchor),
        titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
      ])
      titleLabel.setContentCompressionResistancePriority(.required, for: .vertical)
    }
    
    func configure(image: UIImage?, title: String) {
      imageView.image = image
      titleLabel.text = title
    }
    
}
