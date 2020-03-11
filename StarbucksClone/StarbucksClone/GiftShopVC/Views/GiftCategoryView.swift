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
    private let itemsScrollView = UIScrollView()
    private var collectionViews = [GiftCategoryCollectionView]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        for v in collectionViews {
            itemsScrollView.addSubview(v)
            v.translatesAutoresizingMaskIntoConstraints = false
            v.topAnchor.constraint(equalTo: itemsScrollView.topAnchor).isActive = true
            v.bottomAnchor.constraint(equalTo: itemsScrollView.bottomAnchor).isActive = true
            v.widthAnchor.constraint(equalTo: tagsView.widthAnchor).isActive = true
            v.heightAnchor.constraint(equalTo: itemsScrollView.heightAnchor).isActive = true
            
        }
        
        for idx in 0..<collectionViews.count {
            switch idx {
            case 0:
                collectionViews[idx].leadingAnchor.constraint(equalTo: itemsScrollView.leadingAnchor).isActive = true
            case collectionViews.count-1:
                collectionViews[idx].trailingAnchor.constraint(equalTo: itemsScrollView.trailingAnchor).isActive = true
                fallthrough
            default:
                collectionViews[idx].leadingAnchor.constraint(equalTo: collectionViews[idx-1].trailingAnchor).isActive = true
            }
        }
    }
    
    private func setCollectionItem() {
        
    }
    
    private func setUI() {
        itemsScrollView.isPagingEnabled = true
        
        for _ in 0..<tagsView.tags.count {
            let collectionView = GiftCategoryCollectionView()
            collectionViews.append(collectionView)
        }
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
        
        self.addSubview(itemsScrollView)
        itemsScrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            itemsScrollView.topAnchor.constraint(equalTo: tagsView.bottomAnchor),
            itemsScrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            itemsScrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            itemsScrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
