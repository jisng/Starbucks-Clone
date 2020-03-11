//
//  GiftBoxView.swift
//  StarbucksClone
//
//  Created by 박지승 on 2020/03/10.
//  Copyright © 2020 Hailey. All rights reserved.
//

import UIKit

class GiftBoxView: UIView {
    
    private let getButton = UIButton()
    private let setBuuton = UIButton()
    
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
        
    }
    
    private func setUI() {
        getButton.setTitle("받은 선물", for: .normal)
        getButton.backgroundColor = #colorLiteral(red: 0.5529411765, green: 0.5098039216, blue: 0.4745098039, alpha: 1)
        getButton.setTitleColor(.white, for: .normal)
        getButton.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        getButton.isSelected = true
        
        setBuuton.setTitle("보낸 선물", for: .normal)
        setBuuton.backgroundColor = .white
        setBuuton.setTitleColor(#colorLiteral(red: 0.5529411765, green: 0.5098039216, blue: 0.4745098039, alpha: 1), for: .normal)
        setBuuton.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        
        [getButton, setBuuton].forEach({
            $0.layer.borderWidth = 1
            $0.layer.borderColor = #colorLiteral(red: 0.5529411765, green: 0.5098039216, blue: 0.4745098039, alpha: 1)
            $0.layer.cornerRadius = 4
            $0.titleLabel?.font = .systemFont(ofSize: 12)
            $0.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: self.topAnchor, constant: 12).isActive = true
            $0.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.45).isActive = true
            $0.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.06).isActive = true
        })
        getButton.trailingAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        setBuuton.leadingAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }

    private func setLayout() {
        
    }
    
}
