//
//  ThemeTableViewCell.swift
//  StarbucksClone
//
//  Created by 박지승 on 2020/03/07.
//  Copyright © 2020 Hailey. All rights reserved.
//

import UIKit

class ThemeTableViewCell: UITableViewCell {

    static let id = "themeItemCell"
    
    private let themeView = GiftHomeThemeView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(themeView)
        themeView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            themeView.topAnchor.constraint(equalTo: contentView.topAnchor),
            themeView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            themeView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            themeView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
