//
//  NewTableViewCell.swift
//  StarbucksClone
//
//  Created by 박지승 on 2020/03/06.
//  Copyright © 2020 Hailey. All rights reserved.
//

import UIKit

class NewTableViewCell: UITableViewCell {
    
    static let identifier = "newItemCell"
    
    private let itemView = GiftHomeBestNewView(titleText: "NEW", subTitleText: "오늘 새로 나온 상품")
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        contentView.addSubview(itemView)
        itemView.translatesAutoresizingMaskIntoConstraints = false
        itemView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        itemView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        itemView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        itemView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
}
