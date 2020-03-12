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
        itemImageView.backgroundColor = #colorLiteral(red: 0.937254902, green: 0.9568627451, blue: 0.9607843137, alpha: 1)
        itemImageView.contentMode = .scaleAspectFill
        itemImageView.layer.cornerRadius = 12
        itemImageView.clipsToBounds = true
        
        itemTextLabel.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        itemTextLabel.textAlignment = .center
        itemTextLabel.numberOfLines = 2
        itemTextLabel.lineBreakMode = .byWordWrapping
        itemTextLabel.font = .systemFont(ofSize: 12)
        
    }
    
    private func setLayout() {
        [itemImageView, itemTextLabel].forEach({
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8).isActive = true
            $0.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        })
        itemImageView.heightAnchor.constraint(equalTo: itemImageView.widthAnchor).isActive = true
        itemImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 12).isActive = true
        
        itemTextLabel.topAnchor.constraint(equalTo: itemImageView.bottomAnchor, constant: 12).isActive = true
        itemTextLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
}
