//
//  GiftDetailSuggestionView.swift
//  StarbucksClone
//
//  Created by 박지승 on 2020/03/09.
//  Copyright © 2020 Hailey. All rights reserved.
//

import UIKit

class GiftDetailSuggestionView: UIView {
    
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
    
    private let titleLabel = UILabel()
    private let layout = UICollectionViewFlowLayout()
    private let itemCollectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
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
        titleLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        titleLabel.textColor = .black
        
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
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 28),
//            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor)
            titleLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        self.addSubview(itemCollectionView)
        itemCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            itemCollectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            itemCollectionView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            itemCollectionView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            itemCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
}

extension GiftDetailSuggestionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: GiftDetailCollectionViewCell.id,
                                                      for: indexPath) as! GiftDetailCollectionViewCell
        item.configure(title: data[indexPath.row].title, subtitle: data[indexPath.row].subtitle, price: 0)
        return item
    }
    
    
}
