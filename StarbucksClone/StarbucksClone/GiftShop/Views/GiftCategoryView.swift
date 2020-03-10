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
    
    private let itemCollectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
    private let layout = UICollectionViewFlowLayout()
    
    var dummyData = [
        dummyDataModel(imageName: "starbucks-logo", titleText: "starbucks"),
        dummyDataModel(imageName: "starbucks-logo", titleText: "starbucks-TRY-TRY-TRY"),
        dummyDataModel(imageName: "starbucks-logo", titleText: "starbucks-TRY-TRY-TRY"),
        dummyDataModel(imageName: "starbucks-logo", titleText: "starbucks-TRY-TRY-TRY"),
        dummyDataModel(imageName: "starbucks-logo", titleText: "starbucks-TRY-TRY-TRY"),
        dummyDataModel(imageName: "starbucks-logo", titleText: "starbucks-TRY-TRY-TRY"),
        dummyDataModel(imageName: "starbucks-logo", titleText: "starbucks-TRY-TRY-TRY"),
        dummyDataModel(imageName: "starbucks-logo", titleText: "starbucks-TRY-TRY-TRY"),
        dummyDataModel(imageName: "starbucks-logo", titleText: "starbucks-TRY-TRY-TRY"),
    ]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        
        itemCollectionView.frame = self.frame
        itemCollectionView.collectionViewLayout = layout
        itemCollectionView.dataSource = self
        itemCollectionView.backgroundColor = .white
        
        itemCollectionView.register(CategoryCollectionViewCell.self,
                                    forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)

        layout.scrollDirection = .vertical
        layout.headerReferenceSize = CGSize(width: 0,
                                            height: self.bounds.height*0.12)
        
        let itemsInLine: CGFloat = 2
        let spacing:CGFloat = 10
        let insets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let cWidth = UIScreen.main.bounds.width
        let contentSize = cWidth - insets.left - insets.right - (spacing * itemsInLine - 10)
        let itemSize = (contentSize / itemsInLine).rounded(.down)
        
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        layout.sectionInset = insets
        layout.itemSize = CGSize(width: itemSize, height: itemSize * 1.2)
        
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

extension GiftCategoryView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dummyData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier:CategoryCollectionViewCell.identifier,
                                                      for: indexPath) as! CategoryCollectionViewCell
        
        item.itemImageView.image = UIImage(named: dummyData[indexPath.item].imageName)
        item.itemNameLabel.text = dummyData[indexPath.item].titleText
        item.itemPriceLabel.text = "\(indexPath.item)원"
        
        switch dummyData.count - indexPath.item {
        case 1 where dummyData.count % 2 != 0:
            break
        case 1...2 where dummyData.count % 2 == 0:
            break
        default:
            item.layer.addBorder(edge: .bottom, color: .lightGray, thickness: 1)
        }
        
        switch indexPath.item % 2 {
        case 0:
            item.layer.addBorder(edge: .right, color: .lightGray, thickness: 1)
        default:
            break
        }
        return item
    }
    
}
