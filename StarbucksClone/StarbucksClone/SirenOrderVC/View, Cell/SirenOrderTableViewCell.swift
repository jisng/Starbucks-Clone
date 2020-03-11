//
//  SirenOrderTableViewCell.swift
//  StarbuckCloneEx2
//
//  Created by Mac mini on 2020/03/08.
//  Copyright © 2020 Mac mini. All rights reserved.
//

import UIKit

class SirenOrderTableViewCell: UITableViewCell {
  
  static let identifier = "SirenOrderTableViewCell"
  
  var label = UILabel()
  let flowLayout = UICollectionViewFlowLayout()
  let viewWidth = UIScreen.main.bounds.width
  lazy var collectionView = UICollectionView(frame: CGRect(x: 0, y: 40, width: viewWidth-20, height: 175), collectionViewLayout: flowLayout)
  
  let item = ["카페 아메리카노", "카페 라떼", "디카페인 카페 아메리카노", "자몽 허니 블랙 티", "스타벅스 돌체 라떼", "슈 크림 라떼", "딸기 요거트 블렌디드", "오늘의 커피", "스프링 피치 그린 티"]
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    label.font = UIFont.systemFont(ofSize: 13)
    setupAutoLayout()
    setupCollectionView()
    //contentView.layoutMargins = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    //contentView.layoutMargins = UIEdgeInsets(top: 5, left: 10, bottom: 10, right: 5)
    //contentView.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
    //label.backgroundColor = .white
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  
  func setupFlowLayout() {
    flowLayout.itemSize = CGSize(width: 110, height: 140)
    flowLayout.minimumLineSpacing = 10
    flowLayout.minimumInteritemSpacing = 5
    flowLayout.sectionInset = UIEdgeInsets(top: 20, left: 5, bottom: 20, right: 5)
    flowLayout.scrollDirection = .horizontal
  }
  
  func setupCollectionView() {
    setupFlowLayout()
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.backgroundColor = .white
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.register(SirenOrderCollectionViewCell.self, forCellWithReuseIdentifier: SirenOrderCollectionViewCell.identifier)
    contentView.addSubview(collectionView)
  }
  
  func setupAutoLayout() {
    contentView.addSubview(label)
    label.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
      label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
    ])
  }
  func configure(title: String) {
    label.text = title
  }
}

extension SirenOrderTableViewCell: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return item.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell: UICollectionViewCell!
    let customeCell = collectionView.dequeueReusableCell(withReuseIdentifier: SirenOrderCollectionViewCell.identifier, for: indexPath) as! SirenOrderCollectionViewCell
    customeCell.configure(image: UIImage(named: "SirenOrderCoffee"), title: item[indexPath.item])
    //print(";;", item[indexPath.item])
    cell = customeCell
    
    return cell
  }
}

extension SirenOrderTableViewCell: UICollectionViewDelegateFlowLayout {
  
}
