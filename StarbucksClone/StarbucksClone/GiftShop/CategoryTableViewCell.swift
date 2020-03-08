//
//  CategoryTableViewCell.swift
//  StarbucksClone
//
//  Created by 박지승 on 2020/03/07.
//  Copyright © 2020 Hailey. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    var dummyData = [
        dummyDataModel(imageName: "starbucks-logo", titleText: "starbucks-TRY-TRY-TRY"),
        dummyDataModel(imageName: "starbucks-logo", titleText: "starbucks-TRY-TRY-TRY"),
        dummyDataModel(imageName: "starbucks-logo", titleText: "starbucks-TRY-TRY-TRY"),
        dummyDataModel(imageName: "starbucks-logo", titleText: "starbucks-TRY-TRY-TRY"),
        dummyDataModel(imageName: "starbucks-logo", titleText: "starbucks-TRY-TRY-TRY"),
        dummyDataModel(imageName: "starbucks-logo", titleText: "starbucks-TRY-TRY-TRY"),
        dummyDataModel(imageName: "starbucks-logo", titleText: "starbucks-TRY-TRY-TRY"),
        dummyDataModel(imageName: "starbucks-logo", titleText: "starbucks-TRY-TRY-TRY"),
        dummyDataModel(imageName: "starbucks-logo", titleText: "starbucks-TRY-TRY-TRY"),
    ]
    
    static let identifier = "categoryTableCell"
    
    private let layout = UICollectionViewFlowLayout()
    private let itemCollectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        setLauout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        itemCollectionView.frame = self.frame
        itemCollectionView.backgroundColor = .white
        itemCollectionView.collectionViewLayout = layout
        itemCollectionView.dataSource = self
        itemCollectionView.register(CategoryCollectionViewCell.self,
                                    forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        
        layout.scrollDirection = .vertical

        let itemsInLine: CGFloat = 2
        let spacing:CGFloat = 10
        let insets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let cWidth = UIScreen.main.bounds.width
        let contentSize = cWidth - insets.left - insets.right - (spacing * itemsInLine - 10)
        let itemSize = (contentSize / itemsInLine).rounded(.down) // rounded(.down) 소수점 버리기
        
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        layout.sectionInset = insets
        layout.itemSize = CGSize(width: itemSize, height: itemSize * 1.2)
        
    }
    
    private func setLauout() {
        contentView.addSubview(itemCollectionView)
        itemCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            itemCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            itemCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            itemCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            itemCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

extension CategoryTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dummyData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier:CategoryCollectionViewCell.identifier,
                                                      for: indexPath) as! CategoryCollectionViewCell
        item.layer.addBorder(edge: .bottom, color: .lightGray, thickness: 1)
        switch indexPath.item {
        case indexPath.item where indexPath.item % 2 == 0:
            item.layer.addBorder(edge: .right, color: .lightGray, thickness: 1)
        default:
            item.layer.addBorder(edge: .left, color: .lightGray, thickness: 1)
            break
        }
        return item
    }
    
}

//extension CALayer {
//
//    func addBorder(edge: UIRectEdge, color: UIColor, thickness: CGFloat) {
//        
//        let border = CALayer()
//        let lineWidth = frame.width * 0.8
//        
//        switch edge {
//        case .bottom:
//            border.frame = CGRect(x: (frame.width - lineWidth) / 2,
//                                  y: frame.height - thickness, width: lineWidth, height: thickness)
//        case .left:
//            border.frame = CGRect(x: -5, y: 0,
//                                  width: thickness, height: frame.height)
//        case .right:
//            border.frame = CGRect(x: frame.width + 5 ,
//                                  y: 0, width: thickness, height: UIScreen.main.bounds.height)
//        default:
//            break
//        }
//        border.backgroundColor = color.cgColor
//        addSublayer(border)
//    }
//}
