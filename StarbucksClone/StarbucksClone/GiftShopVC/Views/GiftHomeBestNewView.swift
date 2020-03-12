//
//  GiftHomeBestNewView.swift
//  StarbucksClone
//
//  Created by 박지승 on 2020/03/03.
//  Copyright © 2020 Hailey. All rights reserved.
//

import UIKit

struct dummyDataModel {
    let imageName: String
    let titleText: String
}

class GiftHomeBestNewView: UIView {
    
    var dummyData = [
        dummyDataModel(imageName: "starbucks-logo", titleText: "starbucks"),
        dummyDataModel(imageName: "starbucks-logo", titleText: "starbucks"),
        dummyDataModel(imageName: "starbucks-logo", titleText: "starbucks"),
        dummyDataModel(imageName: "starbucks-logo", titleText: "starbucks"),
        dummyDataModel(imageName: "starbucks-logo", titleText: "starbucks"),
        dummyDataModel(imageName: "starbucks-logo", titleText: "starbucks"),
        dummyDataModel(imageName: "starbucks-logo", titleText: "starbucks"),
        dummyDataModel(imageName: "starbucks-logo", titleText: "starbucks"),
        dummyDataModel(imageName: "starbucks-logo", titleText: "starbucks"),
    ]
    
    var buttonArray = [UIButton]()
    
    @objc func didTapButton(_ button: UIButton) {
        
    }
    
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    
    private let itemScrollView = UIScrollView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
    }
    
    convenience init(titleText: String, subTitleText: String) {
        self.init()
        setUI(title: titleText, subTitle: subTitleText)
        setLayout()
        setItemLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI(title: String, subTitle: String) {
        titleLabel.text = title
        titleLabel.font = .systemFont(ofSize: 24, weight: .bold)
        titleLabel.textColor = .black
        
        subtitleLabel.text = subTitle
        subtitleLabel.textColor = .gray
        subtitleLabel.font = .systemFont(ofSize: 16)
        
        itemScrollView.showsHorizontalScrollIndicator = false
        itemScrollView.showsVerticalScrollIndicator = false
    }
    
    private func setLayout() {
        self.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        
        self.addSubview(subtitleLabel)
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        subtitleLabel.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor).isActive = true
        
        self.addSubview(itemScrollView)
        itemScrollView.translatesAutoresizingMaskIntoConstraints = false
        itemScrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        itemScrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        itemScrollView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        itemScrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    private func setItemLayout() {
        let itemArray = makeItemArray()
        
        for item in itemArray {
            itemScrollView.addSubview(item)
            item.translatesAutoresizingMaskIntoConstraints = false
            item.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.4).isActive = true
            item.heightAnchor.constraint(equalTo: item.widthAnchor).isActive = true
            item.topAnchor.constraint(equalTo: itemScrollView.topAnchor).isActive = true
            item.bottomAnchor.constraint(equalTo: itemScrollView.bottomAnchor).isActive = true
        }
        
        for idx in 0..<itemArray.count {
            switch idx {
            case 0:
                itemArray[idx].leadingAnchor.constraint(equalTo: itemScrollView.leadingAnchor).isActive = true
            case itemArray.count-1:
                itemArray[idx].leadingAnchor.constraint(equalTo: itemArray[idx-1].trailingAnchor).isActive = true
                itemArray[idx].trailingAnchor.constraint(equalTo: itemScrollView.trailingAnchor).isActive = true
            default:
                itemArray[idx].leadingAnchor.constraint(equalTo: itemArray[idx-1].trailingAnchor).isActive = true
            }
        }
        
        for idx in 0..<itemArray.count {
            let button = UIButton()
//            button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
            buttonArray.append(button)
            itemScrollView.addSubview(button)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.topAnchor.constraint(equalTo: itemArray[idx].topAnchor).isActive = true
            button.leadingAnchor.constraint(equalTo: itemArray[idx].leadingAnchor).isActive = true
            button.trailingAnchor.constraint(equalTo: itemArray[idx].trailingAnchor).isActive = true
            button.bottomAnchor.constraint(equalTo: itemArray[idx].bottomAnchor).isActive = true
        }
    }
    
    private func makeItemArray() -> [UIView] {
        var itemArray: [UIView] = []
        for data in dummyData {
            let itemView = GiftHomeItemView(image: data.imageName, text: data.titleText)
            itemArray.append(itemView)
        }
        return itemArray
    }
}
