//
//  GiftCategoryView.swift
//  StarbucksClone
//
//  Created by 박지승 on 2020/03/10.
//  Copyright © 2020 Hailey. All rights reserved.
//

import UIKit

class GiftCategoryView: UIView {
    
    private let tagsView = GiftCategoryTagsView()
    private let itemCollectionView = GiftCategoryCollectionView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        
    }
    
    private func setLayout() {
        self.addSubview(tagsView)
        tagsView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tagsView.topAnchor.constraint(equalTo: self.topAnchor),
            tagsView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tagsView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tagsView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.14)
        ])
        
        self.addSubview(itemCollectionView)
        itemCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            itemCollectionView.topAnchor.constraint(equalTo: tagsView.bottomAnchor),
            itemCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            itemCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            itemCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
