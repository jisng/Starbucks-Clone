//
//  GiftBoxView.swift
//  StarbucksClone
//
//  Created by 박지승 on 2020/03/10.
//  Copyright © 2020 Hailey. All rights reserved.
//

import UIKit

class GiftBoxView: UIView {
    
    private let tags = ["받은 선물", "보낸 선물"]
    lazy var presentSegement = UISegmentedControl(items: tags)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
//        setUI()
//        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        presentSegement.selectedSegmentTintColor = #colorLiteral(red: 0.5529411765, green: 0.5098039216, blue: 0.4745098039, alpha: 1)
        presentSegement.backgroundColor = .white
        presentSegement.tintColor = #colorLiteral(red: 0.5529411765, green: 0.5098039216, blue: 0.4745098039, alpha: 1)
    }
    
    private func setLayout() {
        self.addSubview(presentSegement)
        presentSegement.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8).isActive = true
        self.topAnchor.constraint(equalTo: self.topAnchor, constant: 100).isActive = true
    }
    
}
