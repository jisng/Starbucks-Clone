//
//  BestTableViewCell.swift
//  StarbucksClone
//
//  Created by 박지승 on 2020/03/06.
//  Copyright © 2020 Hailey. All rights reserved.
//

import UIKit

class BestTableViewCell: UITableViewCell {
    
    static let identifier = "bestItemCell"
    
    var bestData = ["카페 아메리카노", "부드러운 디저트 세트", "행운의 금메달 세트",
                        "Happy Birthday 세트", "슈 크림을 좋아하는 너를 위한 세트", "너만큼 완벽한 디저트 세트",
                        "슈크림 라떼 커플 세트", "생일 축하해요 세트", "달콤한 디저트 세트"]
    
    lazy var itemView = GiftHomeBestNewView(titleText: "BEST", subTitleText: "어제 가장 많이 선물한 상품", data: bestData)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        contentView.addSubview(itemView)
        itemView.translatesAutoresizingMaskIntoConstraints = false
        itemView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        itemView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        itemView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        itemView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
}
