//
//  GiftHomeTagLineView.swift
//  StarbucksClone
//
//  Created by 박지승 on 2020/03/04.
//  Copyright © 2020 Hailey. All rights reserved.
//

import UIKit

class GiftHomeTagLineView: UIView {
    
    let centerXLineLabel = UILabel()
    let topCenterYLineLabel = UILabel()
    let bottomCenterYLineLabel = UILabel()
    let topLeftYLineLabel = UILabel()
    let bottomLeftYLineLabel = UILabel()
    let topRightYLineLabel = UILabel()
    let bottomRightYLineLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setLine()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        let heightPadding: CGFloat = self.bounds.maxY/4
        [topLeftYLineLabel, topCenterYLineLabel, topRightYLineLabel].forEach({
            $0.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -heightPadding).isActive = true
        })
        [bottomLeftYLineLabel, bottomCenterYLineLabel, bottomRightYLineLabel].forEach({
            $0.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: heightPadding).isActive = true
        })
        
        let widthPadding: CGFloat = self.bounds.maxX/4
        NSLayoutConstraint.activate([
            topLeftYLineLabel.centerXAnchor.constraint(equalTo: topCenterYLineLabel.centerXAnchor,
                                                       constant: -widthPadding),
            topRightYLineLabel.centerXAnchor.constraint(equalTo: topCenterYLineLabel.centerXAnchor,
                                                        constant: widthPadding),
            bottomLeftYLineLabel.centerXAnchor.constraint(equalTo: bottomCenterYLineLabel.centerXAnchor,
                                                          constant: -widthPadding),
            bottomRightYLineLabel.centerXAnchor.constraint(equalTo: bottomCenterYLineLabel.centerXAnchor,
                                                           constant: widthPadding)
        ])
    }
    
    private func setLine() {
        centerXLineLabel.backgroundColor = .lightGray
        self.addSubview(centerXLineLabel)
        centerXLineLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            centerXLineLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            centerXLineLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            centerXLineLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9),
            centerXLineLabel.heightAnchor.constraint(equalToConstant: 1),
        ])
        
        [topCenterYLineLabel, bottomCenterYLineLabel,topLeftYLineLabel, topRightYLineLabel, bottomLeftYLineLabel, bottomRightYLineLabel].forEach({
            $0.backgroundColor = .lightGray
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.widthAnchor.constraint(equalToConstant: 1).isActive = true
            $0.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.3).isActive = true
        })
        topCenterYLineLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        bottomCenterYLineLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
}
