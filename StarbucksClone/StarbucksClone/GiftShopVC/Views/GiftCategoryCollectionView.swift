//
//  GiftCategoryCollectionView.swift
//  StarbucksClone
//
//  Created by 박지승 on 2020/03/11.
//  Copyright © 2020 Hailey. All rights reserved.
//

import UIKit

class GiftCategoryCollectionView: UIView {
    
//    var dummyData = [
//        dummyDataModel(imageName: "starbucks-logo", titleText: "starbucks"),
//        dummyDataModel(imageName: "starbucks-logo", titleText: "starbucks-TRY-TRY-TRY"),
//        dummyDataModel(imageName: "starbucks-logo", titleText: "starbucks-TRY-TRY-TRY"),
//        dummyDataModel(imageName: "starbucks-logo", titleText: "starbucks-TRY-TRY-TRY"),
//        dummyDataModel(imageName: "starbucks-logo", titleText: "starbucks-TRY-TRY-TRY"),
//        dummyDataModel(imageName: "starbucks-logo", titleText: "starbucks-TRY-TRY-TRY"),
//        dummyDataModel(imageName: "starbucks-logo", titleText: "starbucks-TRY-TRY-TRY"),
//        dummyDataModel(imageName: "starbucks-logo", titleText: "starbucks-TRY-TRY-TRY"),
//        dummyDataModel(imageName: "starbucks-logo", titleText: "starbucks-TRY-TRY-TRY"),
//    ]
    
    var data = [
        GiftItem(title: "오후에 녹차 한잔 세트",
                 subtitle: "머그컵1개, 녹차 티바나 1개",
                 price: 31000),
        GiftItem(title: "달콤한 우리 사랑 세트",
                 subtitle: "시즌 한정 세트",
                 price: 14600),
        GiftItem(title: "화이트 데이 캔디 세트",
                 subtitle: "화이트데이 시즌 한정, 조기 재고 소진될 수 있습니다",
                 price: 25600),
        GiftItem(title: "오후에 녹차 한잔 세트",
                 subtitle: "머그컵1개, 녹차 티바나 1개",
                 price: 31000),
        GiftItem(title: "달콤한 우리 사랑 세트",
                 subtitle: "시즌 한정 세트",
                 price: 14600),
        GiftItem(title: "화이트 데이 캔디 세트",
                 subtitle: "화이트데이 시즌 한정, 조기 재고 소진될 수 있습니다",
                 price: 25600),
        GiftItem(title: "오후에 녹차 한잔 세트",
                 subtitle: "머그컵1개, 녹차 티바나 1개",
                 price: 31000),
        GiftItem(title: "달콤한 우리 사랑 세트",
                 subtitle: "시즌 한정 세트",
                 price: 14600),
        GiftItem(title: "화이트 데이 캔디 세트",
                 subtitle: "화이트데이 시즌 한정, 조기 재고 소진될 수 있습니다",
                 price: 25600)
    ].shuffled()
    
    private let itemCollectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
    private let layout = UICollectionViewFlowLayout()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    convenience init(data: [GiftItem]) {
        self.init()
        self.data = data
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        itemCollectionView.frame = self.frame
        itemCollectionView.collectionViewLayout = layout
        itemCollectionView.dataSource = self
        itemCollectionView.delegate = self
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
        self.addSubview(itemCollectionView)
        itemCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            itemCollectionView.topAnchor.constraint(equalTo: self.topAnchor),
            itemCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            itemCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            itemCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

extension GiftCategoryCollectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier:CategoryCollectionViewCell.identifier,
                                                      for: indexPath) as! CategoryCollectionViewCell
        
        item.itemImageView.image = UIImage(named: data[indexPath.item].title)
        item.itemNameLabel.text = data[indexPath.item].title
        item.itemPriceLabel.text = "\(data[indexPath.item].price)원"
        
        switch data.count - indexPath.item {
        case 1 where data.count % 2 != 0:
            break
        case 1...2 where data.count % 2 == 0:
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

extension GiftCategoryCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
        guard let navi = self.parentNaviController else { return }
        navi.pushViewController(GiftItemDetailViewController(data: cell.item), animated: true)
    }
}
