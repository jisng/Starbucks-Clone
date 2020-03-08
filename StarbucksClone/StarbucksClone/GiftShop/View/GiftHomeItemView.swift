//
//  GiftHomeItemView.swift
//  StarbucksClone
//
//  Created by 박지승 on 2020/03/06.
//  Copyright © 2020 Hailey. All rights reserved.
//

import UIKit

class GiftHomeItemView: UIView {

    private let itemImageView = UIImageView()
    private let itemTextLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(image: String, text: String) {
        self.init()
        itemImageView.image = UIImage(named: image)
        itemTextLabel.text = text
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        itemImageView.backgroundColor = .lightGray
        itemImageView.contentMode = .scaleAspectFit
        itemImageView.layer.cornerRadius = 16
        itemImageView.clipsToBounds = true
        
        itemTextLabel.textColor = .gray
        itemTextLabel.textAlignment = .center
//        itemTextLabel.font = .systemFont(ofSize: 16)
    }
    
    private func setLayout() {
        [itemImageView, itemTextLabel].forEach({
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8).isActive = true
            $0.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        })
        itemImageView.heightAnchor.constraint(equalTo: itemImageView.widthAnchor).isActive = true
        itemImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
        
        itemTextLabel.topAnchor.constraint(equalTo: itemImageView.bottomAnchor, constant: 16).isActive = true
        itemTextLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16).isActive = true
    }
    
}
