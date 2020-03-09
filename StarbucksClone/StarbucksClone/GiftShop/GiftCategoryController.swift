//
//  GiftCategoryController.swift
//  StarbucksClone
//
//  Created by 박지승 on 2020/03/07.
//  Copyright © 2020 Hailey. All rights reserved.
//

import UIKit

class GiftCategoryController: UIViewController {
    
    private let layout = UICollectionViewFlowLayout()
    private let itemCollectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLauout()
    }
    
    private func setUI() {
        itemCollectionView.frame = view.frame
        itemCollectionView.collectionViewLayout = layout
        itemCollectionView.dataSource = self
        itemCollectionView.backgroundColor = .white
        
        itemCollectionView.register(CategoryCollectionViewCell.self,
                                    forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        itemCollectionView.register(TagHeaderCollectionView.self,
                                    forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                    withReuseIdentifier: TagHeaderCollectionView.id)
        
        layout.scrollDirection = .vertical
        layout.headerReferenceSize = CGSize(width: 0,
                                            height: view.bounds.height*0.12)
        layout.sectionHeadersPinToVisibleBounds = true
        
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
    
    private func setLauout() {
        view.addSubview(itemCollectionView)
        itemCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        let guide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            itemCollectionView.topAnchor.constraint(equalTo: guide.topAnchor),
            itemCollectionView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            itemCollectionView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            itemCollectionView.bottomAnchor.constraint(equalTo: guide.bottomAnchor)
        ])
    }
}

extension GiftCategoryController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: TagHeaderCollectionView.id,
            for: indexPath) as! TagHeaderCollectionView
        return headerView
    }
    
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
        case 1:
            item.layer.addBorder(edge: .left, color: .lightGray, thickness: 1)
        default:
            break
        }
        
        return item
    }
    
}
