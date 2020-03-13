//
//  GiftDetailCollectionViewCell.swift
//  StarbucksClone
//
//  Created by 박지승 on 2020/03/09.
//  Copyright © 2020 Hailey. All rights reserved.
//

import UIKit

class GiftDetailCollectionViewCell: UICollectionViewCell {
    
    static let id = "DetailItemCell"
    
    private let itemImageView = UIImageView()
    private let itemTitle = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(title: String, subtitle: String, price: Int) {
        itemImageView.image = UIImage(named: title)
        itemTitle.text = title
    }
    
    private func setUI() {
        itemImageView.backgroundColor = #colorLiteral(red: 0.9411764706, green: 0.9568627451, blue: 0.9607843137, alpha: 1)
        itemImageView.contentMode = .scaleAspectFit
        itemImageView.layer.cornerRadius = 8
        itemImageView.clipsToBounds = true
        
        itemTitle.font = .systemFont(ofSize: 14)
        itemTitle.numberOfLines = 2
        itemTitle.lineBreakMode = .byWordWrapping
        itemTitle.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    }
    
    private func setLayout() {
        [itemImageView, itemTitle].forEach({
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
            $0.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        })
        
        itemImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        itemImageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.68).isActive = true
        
//        itemTitle.topAnchor.constraint(equalTo: itemImageView.bottomAnchor, constant: 12).isActive = true
        itemTitle.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.24).isActive = true
        itemTitle.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
    }
}
