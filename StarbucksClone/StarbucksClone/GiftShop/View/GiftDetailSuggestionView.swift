//
//  GiftDetailSuggestionView.swift
//  StarbucksClone
//
//  Created by 박지승 on 2020/03/09.
//  Copyright © 2020 Hailey. All rights reserved.
//

import UIKit

class GiftDetailSuggestionView: UIView {
    
    private let titleLabel = UILabel()
    private let layout = UICollectionViewFlowLayout()
    private let itemCollectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width * 0.32,
                                 height: UIScreen.main.bounds.width * 0.48)
    }
    
    private func setUI() {
        titleLabel.text = "이런 선물은 어떠세요?"
        titleLabel.font = .systemFont(ofSize: 18, weight: .semibold)
        
        itemCollectionView.frame = self.frame
        itemCollectionView.collectionViewLayout = layout
        itemCollectionView.dataSource = self
        itemCollectionView.backgroundColor = .white
        itemCollectionView.register(GiftDetailCollectionViewCell.self,
                                    forCellWithReuseIdentifier: GiftDetailCollectionViewCell.id)
        
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 12
        layout.minimumInteritemSpacing = 12
//        layout.sectionInset = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
        
    }
    
    private func setLayout() {
        self.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        ])
        
        self.addSubview(itemCollectionView)
        itemCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            itemCollectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            itemCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            itemCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            itemCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
}

extension GiftDetailSuggestionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: GiftDetailCollectionViewCell.id,
                                                      for: indexPath) as! GiftDetailCollectionViewCell
        return item
    }
    
    
}
