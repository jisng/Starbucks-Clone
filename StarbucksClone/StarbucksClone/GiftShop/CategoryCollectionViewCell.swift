//
//  CategoryCollectionViewCell.swift
//  StarbucksClone
//
//  Created by 박지승 on 2020/03/07.
//  Copyright © 2020 Hailey. All rights reserved.
//

import UIKit

struct CategoryItemModel {
    let itemImageName: String
    let itemName: String
    let itemPrice: Int
}

class CategoryCollectionViewCell: UICollectionViewCell {
    
    var item = CategoryItemModel(itemImageName: "starbucks-logo", itemName: "starbucks-item-TRY-TRY-flfkdjalfidjafidjasi", itemPrice: 20000)
    
    static let identifier = "CategoryCollectionCell"
    
     let itemImageView = UIImageView()
     let itemNameLabel = UILabel()
     let itemPriceLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
//        itemImageView.image = UIImage(named: item.itemImageName)
        itemImageView.contentMode = .scaleAspectFit
        
//        itemNameLabel.text = item.itemName
        itemNameLabel.textColor = .gray
        itemNameLabel.textAlignment = .center
        itemNameLabel.lineBreakMode = .byWordWrapping
        itemNameLabel.numberOfLines = 2
        
//        itemPriceLabel.text = "\(item.itemPrice)원"
        itemPriceLabel.textAlignment = .center
        itemPriceLabel.font = .systemFont(ofSize: 14, weight: .bold)
    }
    
    private func setLayout() {
        [itemImageView, itemNameLabel, itemPriceLabel].forEach({
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        })
        NSLayoutConstraint.activate([
            itemImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.64),
            itemImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            
            itemNameLabel.topAnchor.constraint(equalTo: itemImageView.bottomAnchor, constant: 8),
            itemNameLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.8),
            
            itemPriceLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.16),
            itemPriceLabel.topAnchor.constraint(equalTo: itemNameLabel.bottomAnchor),
//            itemPriceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
    }
}
