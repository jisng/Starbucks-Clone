//
//  GiftItemDetailView.swift
//  StarbucksClone
//
//  Created by 박지승 on 2020/03/09.
//  Copyright © 2020 Hailey. All rights reserved.
//

import UIKit

struct productDummy {
    let imageName: String
    let titleName: String
    let subtitleName: String
    let price: Int
}

class GiftItemDetailView: UIView {
    
    var product = productDummy(imageName: "starbucks-logo", titleName: "부드러운 디저트 세트", subtitleName: "카페 아메리카노 Tall 2잔 + 부드러운 생크림 카스테라", price: 10000)
    var count = 1 {
        willSet {
            countLabel.text = "\(newValue)"
        }
    }

    private let itemImageView = UIImageView()
    private let itemTitleLabel = UILabel()
    private let itemSubtitleLabel = UILabel()
    private let itemPriceLabel = UILabel()
    private let minusButton = UIButton()
    private let plusButton = UIButton()
    private let countLabel = UILabel()
    private let addButton = UIButton()
    private let presentButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func didTapButton(_ button: UIButton) {
        switch button.currentImage {
        case UIImage(systemName: "minus"):
            if count > 1 {
                count -= 1
            }
        case UIImage(systemName: "plus"):
            count += 1
        default:
            break
        }
    }
    
    private func setUI() {
        [itemTitleLabel, itemSubtitleLabel, itemPriceLabel, countLabel].forEach({
            $0.textColor = .black
        })
        
        itemImageView.image = UIImage(named: product.imageName)
        itemImageView.contentMode = .scaleAspectFit
        
        itemTitleLabel.text = product.titleName
        itemTitleLabel.font = .systemFont(ofSize: 20, weight: .bold)
        
        itemSubtitleLabel.text = product.subtitleName
        itemSubtitleLabel.font = .systemFont(ofSize: 14, weight: .medium)
        
        itemPriceLabel.text = "\(product.price) 원"
        itemPriceLabel.font = .systemFont(ofSize: 24, weight: .bold)
        itemPriceLabel.textColor = #colorLiteral(red: 0.6618039012, green: 0.5844079852, blue: 0.391377151, alpha: 1)
        
        plusButton.setImage(UIImage(systemName: "plus"), for: .normal)
        plusButton.imageView?.isHighlighted = true
        plusButton.layer.cornerRadius = 4
        plusButton.tintColor = #colorLiteral(red: 0.4504895806, green: 0.4027304351, blue: 0.3770147562, alpha: 1)
        plusButton.backgroundColor = #colorLiteral(red: 0.829349339, green: 0.8158304095, blue: 0.7850875258, alpha: 1)
        
        minusButton.setImage(UIImage(systemName: "minus"), for: .normal)
        minusButton.imageView?.isHighlighted = true
        minusButton.layer.cornerRadius = 4
        minusButton.tintColor = #colorLiteral(red: 0.4504895806, green: 0.4027304351, blue: 0.3770147562, alpha: 1)
        minusButton.backgroundColor = #colorLiteral(red: 0.829349339, green: 0.8158304095, blue: 0.7850875258, alpha: 1)
        
        countLabel.text = "1"
//        "\(count)"
        countLabel.textAlignment = .center
        countLabel.font = .systemFont(ofSize: 16, weight: .bold)
        
        addButton.setTitle("담기", for: .normal)
        addButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        addButton.setTitleColor(#colorLiteral(red: 0.5289751887, green: 0.4811838269, blue: 0.45547086, alpha: 1), for: .normal)
        addButton.backgroundColor = #colorLiteral(red: 0.8411129713, green: 0.8275960088, blue: 0.7968521714, alpha: 1)
        addButton.layer.cornerRadius = 2
        
        presentButton.setTitle("선물하기", for: .normal)
        presentButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        presentButton.setTitleColor(#colorLiteral(red: 0.9606098533, green: 0.9609289765, blue: 0.956355989, alpha: 1), for: .normal)
        presentButton.backgroundColor = #colorLiteral(red: 0.4786907434, green: 0.4260859191, blue: 0.4004599154, alpha: 1)
        presentButton.layer.cornerRadius = 2
        
        [minusButton, plusButton, addButton, presentButton].forEach({
            $0.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        })
    }
    
    private func setLayout() {
        [itemImageView, itemTitleLabel, itemSubtitleLabel, itemPriceLabel, countLabel, minusButton, plusButton, addButton, presentButton].forEach({
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        })
        
        NSLayoutConstraint.activate([
            itemImageView.topAnchor.constraint(equalTo: self.topAnchor),
            itemImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            itemImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            itemImageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.64),
            
            itemTitleLabel.topAnchor.constraint(equalTo: itemImageView.bottomAnchor),
            itemTitleLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.96),
            itemTitleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//            itemTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
//            itemTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            itemTitleLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.1),
            
            itemSubtitleLabel.topAnchor.constraint(equalTo: itemTitleLabel.bottomAnchor),
            itemSubtitleLabel.leadingAnchor.constraint(equalTo: itemTitleLabel.leadingAnchor),
            itemSubtitleLabel.trailingAnchor.constraint(equalTo: itemTitleLabel.trailingAnchor),
            itemSubtitleLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.02),
            
            itemPriceLabel.topAnchor.constraint(equalTo: itemSubtitleLabel.bottomAnchor),
            itemPriceLabel.leadingAnchor.constraint(equalTo: itemTitleLabel.leadingAnchor),
            itemPriceLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.6),
            itemPriceLabel.bottomAnchor.constraint(equalTo: addButton.topAnchor),
            
            minusButton.leadingAnchor.constraint(equalTo: itemPriceLabel.trailingAnchor),
            minusButton.centerYAnchor.constraint(equalTo: itemPriceLabel.centerYAnchor),
            minusButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.09),
            minusButton.heightAnchor.constraint(equalTo: minusButton.widthAnchor),
            
            countLabel.topAnchor.constraint(equalTo: minusButton.topAnchor),
            countLabel.leadingAnchor.constraint(equalTo: minusButton.trailingAnchor),
            countLabel.bottomAnchor.constraint(equalTo: minusButton.bottomAnchor),
            countLabel.trailingAnchor.constraint(equalTo: plusButton.leadingAnchor),
//            countLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.2),
            
            plusButton.topAnchor.constraint(equalTo: minusButton.topAnchor),
            plusButton.bottomAnchor.constraint(equalTo: minusButton.bottomAnchor),
            plusButton.trailingAnchor.constraint(equalTo: itemTitleLabel.trailingAnchor),
            plusButton.widthAnchor.constraint(equalTo: minusButton.heightAnchor),
            
            addButton.leadingAnchor.constraint(equalTo: itemTitleLabel.leadingAnchor),
            addButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.44),
            addButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            addButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.08),
            
            presentButton.trailingAnchor.constraint(equalTo: itemTitleLabel.trailingAnchor),
            presentButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.44),
            presentButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            presentButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.08)
        ])
    }

}
