//
//  SirenOrderMenuStoryTableViewCell.swift
//  StarbuckCloneEx2
//
//  Created by Mac mini on 2020/03/08.
//  Copyright © 2020 Mac mini. All rights reserved.
//

import UIKit

class SirenOrderMenuStoryTableViewCell: UITableViewCell {
  
  static let identifier = "MenuStoryTableViewCell"
  
  let starBucksLabel = UILabel()
  let menuStoryLabel = UILabel()
  let lineView = UIView()
  let viewWidth = UIScreen.main.bounds.width
  
  let flowLayout = UICollectionViewFlowLayout()
  lazy var collectionView = UICollectionView(frame: CGRect(x: 0, y: 80, width: viewWidth, height: viewWidth/4
  ), collectionViewLayout: flowLayout)
  
  let items = ["menuStory0", "menuStory1", "menuStory2", "menuStory3"]
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setUI()
    setupAutolayout()
    setupCollectionView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setupFlowLayout() {
    flowLayout.itemSize = CGSize(width: viewWidth/5*2 , height: viewWidth/4)
    flowLayout.minimumLineSpacing = 10
    flowLayout.minimumInteritemSpacing = 5
    flowLayout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 20, right: 5)
    flowLayout.scrollDirection = .horizontal
  }
  
  func setupCollectionView() {
    setupFlowLayout()
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.backgroundColor = .darkGray
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.register(SirenOrderMenuStoryCollectionViewCell.self, forCellWithReuseIdentifier: SirenOrderMenuStoryCollectionViewCell.identifier)
    contentView.addSubview(collectionView)
  }
  
  func setUI() {
    starBucksLabel.text = "STARBUCKS"
    starBucksLabel.textColor = #colorLiteral(red: 1, green: 0.8323456645, blue: 0.4732058644, alpha: 1)
    starBucksLabel.font = UIFont.systemFont(ofSize: 10)
    menuStoryLabel.text = "메뉴 이야기"
    menuStoryLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    menuStoryLabel.font = UIFont.systemFont(ofSize: 13)
    lineView.backgroundColor = #colorLiteral(red: 1, green: 0.8323456645, blue: 0.4732058644, alpha: 1)
    contentView.backgroundColor = .darkGray
  }
  
  func setupAutolayout() {
    [starBucksLabel, menuStoryLabel, lineView].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      contentView.addSubview($0)
    }
    let lineWidth = viewWidth - 30
    
    NSLayoutConstraint.activate([
      starBucksLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
      starBucksLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
      
      menuStoryLabel.topAnchor.constraint(equalTo: starBucksLabel.bottomAnchor, constant: 2),
      menuStoryLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
      
      lineView.topAnchor.constraint(equalTo: menuStoryLabel.bottomAnchor, constant: 10),
      lineView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
      lineView.widthAnchor.constraint(equalToConstant: lineWidth),
      lineView.heightAnchor.constraint(equalToConstant: 1),
    ])
  }
}
extension SirenOrderMenuStoryTableViewCell: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    items.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SirenOrderMenuStoryCollectionViewCell.identifier, for: indexPath) as! SirenOrderMenuStoryCollectionViewCell
    cell.configure(image: UIImage(named: items[indexPath.item]))
    cell.backgroundColor = .darkGray
    return cell
  }
  
}

extension SirenOrderMenuStoryTableViewCell: UICollectionViewDelegateFlowLayout {
  
}

