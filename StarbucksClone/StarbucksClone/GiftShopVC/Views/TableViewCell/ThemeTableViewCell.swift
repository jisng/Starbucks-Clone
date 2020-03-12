//
//  ThemeTableViewCell.swift
//  StarbucksClone
//
//  Created by 박지승 on 2020/03/07.
//  Copyright © 2020 Hailey. All rights reserved.
//

import UIKit

class ThemeTableViewCell: UITableViewCell {

    static let id = "themeItemCell"
    
    private let titleLabel = UILabel()
    
    private let item1Button = UIButton()
    private let item2Button = UIButton()
    private let item3Button = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .white
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        let height:CGFloat = (self.bounds.height - (20*3) - (12*2)) / 3.2
        
        [item1Button, item2Button, item3Button].forEach({
            $0.heightAnchor.constraint(equalToConstant: height).isActive = true
        })
    }
    
    @objc private func pushVC(_ button: UIButton) {
        guard let navi = self.parentNaviController else { return }
        navi.pushViewController(GiftThemeDetailViewController(), animated: true)
    }
    
    private func setUI() {
        
        titleLabel.text = "테마 선물"
        titleLabel.font = .systemFont(ofSize: 24, weight: .bold)
        titleLabel.textColor = .black
        
        item1Button.setImage(UIImage(named: "starbucks-logo"), for: .normal)
        item2Button.setImage(UIImage(named: "starbucks-logo"), for: .normal)
        item3Button.setImage(UIImage(named: "starbucks-logo"), for: .normal)
        
        [item1Button, item2Button, item3Button].forEach({
            $0.layer.cornerRadius = 16
            $0.addTarget(self, action: #selector(pushVC(_:)), for: .touchUpInside)
        })
    }
    
    private func setLayout() {
        self.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
        [item1Button, item2Button, item3Button].forEach({
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
            $0.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        })
        NSLayoutConstraint.activate([
            item1Button.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            item2Button.topAnchor.constraint(equalTo: item1Button.bottomAnchor, constant: 12),
            item3Button.topAnchor.constraint(equalTo: item2Button.bottomAnchor, constant: 12),
            item3Button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20)
        ])
        
    }
}
