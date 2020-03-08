//
//  GiftCategoryController.swift
//  StarbucksClone
//
//  Created by 박지승 on 2020/03/07.
//  Copyright © 2020 Hailey. All rights reserved.
//

import UIKit

class GiftCategoryController: UIViewController {

//    private let categoryTableView = UITableView()
    
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
        view.addSubview(itemCollectionView)
        itemCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            itemCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            itemCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            itemCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            itemCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension GiftCategoryController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dummyData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier:CategoryCollectionViewCell.identifier,
                                                      for: indexPath) as! CategoryCollectionViewCell
        
        item.itemImageView.image = UIImage(named: dummyData[indexPath.item].imageName)
        item.itemNameLabel.text = dummyData[indexPath.item].titleText
        item.itemPriceLabel.text = "--,---원"
        
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
            item.layer.addBorder(edge: .left, color: .lightGray, thickness: 1)
            break
        }
        return item
    }
    
}

extension CALayer {
    
    func addBorder(edge: UIRectEdge, color: UIColor, thickness: CGFloat) {
        
        let border = CALayer()
        let lineWidth = frame.width * 0.8
        
        switch edge {
        case .bottom:
            border.frame = CGRect(x: (frame.width - lineWidth) / 2,
                                  y: frame.height - thickness, width: lineWidth, height: thickness)
        case .left:
            border.frame = CGRect(x: -5, y: 0,
                                  width: thickness, height: frame.height)
        case .right:
            border.frame = CGRect(x: frame.width + 5 ,
                                  y: 0, width: thickness, height: frame.height + 10)
        default:
            break
        }
        border.backgroundColor = color.cgColor
        addSublayer(border)
    }
}

    
    
//    private func setUI() {
//        categoryTableView.rowHeight = UIScreen.main.bounds.height - 100
//        categoryTableView.dataSource = self
//        categoryTableView.register(CategoryTableViewCell.self,
//                                   forCellReuseIdentifier: CategoryTableViewCell.identifier)
//
//        view.addSubview(categoryTableView)
//        categoryTableView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            categoryTableView.topAnchor.constraint(equalTo: view.topAnchor),
//            categoryTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            categoryTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            categoryTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//        ])
//    }
//}

//extension GiftCategoryController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        1
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier:CategoryTableViewCell.identifier,
//                                                 for: indexPath) as! CategoryTableViewCell
//        return cell
//    }
//}
