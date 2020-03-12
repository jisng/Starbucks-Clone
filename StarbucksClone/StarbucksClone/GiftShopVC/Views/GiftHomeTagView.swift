//
//  GiftHomeTagView.swift
//  StarbucksClone
//
//  Created by 박지승 on 2020/03/03.
//  Copyright © 2020 Hailey. All rights reserved.
//

import UIKit

class GiftHomeTagView: GiftHomeTagLineView {
    
    private let loveButton = UIButton()
    private let cheerButton = UIButton()
    private let birthButton = UIButton()
    private let thanksButton = UIButton()
    
    private let dollarButton = UIButton()
    private let friendShipButton = UIButton()
    private let marryButton = UIButton()
    private let cardButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    @objc func didTapButton (_ sender: UIButton) {
       
        ButtonToScroll.shared.categoryButtons.first?.sendActions(for: .touchUpInside)
    
        for button in ButtonToScroll.shared.detailButtons {

            guard let title = button.currentTitle else { return }
            
            if title.contains(sender.currentTitle!) {
                guard let idx = ButtonToScroll.shared.detailButtons.firstIndex(of: button) else { return }
                ButtonToScroll.shared.detailButtons[idx].sendActions(for: .touchUpInside)
            }
            
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        [loveButton, cheerButton, birthButton, thanksButton, dollarButton, friendShipButton, marryButton, cardButton].forEach({
            $0.imageView?.contentMode = .scaleAspectFit
//            $0.setTitleColor(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), for: .normal)
//            $0.titleLabel?.font = .systemFont(ofSize: 12)
            $0.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        })
        
        loveButton.setTitle("Love", for: .normal)
        loveButton.setImage(UIImage(named: "Love"), for: .normal)
        cheerButton.setTitle("응원", for: .normal)
        cheerButton.setImage(UIImage(named: "cheerUp"), for: .normal)
        birthButton.setTitle("생일", for: .normal)
        birthButton.setImage(UIImage(named: "birthday"), for: .normal)
        thanksButton.setTitle("감사", for: .normal)
        thanksButton.setImage(UIImage(named: "thanks"), for: .normal)
        dollarButton.setTitle("1-2만원대선물", for: .normal)
        dollarButton.setImage(UIImage(named: "gift"), for: .normal)
        friendShipButton.setTitle("우정", for: .normal)
        friendShipButton.setImage(UIImage(named: "friendship"), for: .normal)
        marryButton.setTitle("결혼", for: .normal)
        marryButton.setImage(UIImage(named: "marry"), for: .normal)
        cardButton.setTitle("e-Gift Card", for: .normal)
        cardButton.setImage(UIImage(named: "eCard"), for: .normal)
    }
    
    private func setLayout() {
        [loveButton, cheerButton, birthButton, thanksButton].forEach({
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                $0.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
                $0.bottomAnchor.constraint(equalTo: centerXLineLabel.topAnchor, constant: -8)
            ])
        })
        NSLayoutConstraint.activate([
            loveButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            loveButton.trailingAnchor.constraint(equalTo: topLeftYLineLabel.leadingAnchor),
            
            cheerButton.leadingAnchor.constraint(equalTo: topLeftYLineLabel.trailingAnchor),
            cheerButton.trailingAnchor.constraint(equalTo: topCenterYLineLabel.leadingAnchor),
            
            birthButton.leadingAnchor.constraint(equalTo: topCenterYLineLabel.trailingAnchor),
            birthButton.trailingAnchor.constraint(equalTo: topRightYLineLabel.leadingAnchor),
            
            thanksButton.leadingAnchor.constraint(equalTo: topRightYLineLabel.trailingAnchor),
            thanksButton.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
        [dollarButton, friendShipButton, marryButton, cardButton].forEach({
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                $0.topAnchor.constraint(equalTo: centerXLineLabel.bottomAnchor, constant: 8),
                $0.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8)
            ])
        })
        NSLayoutConstraint.activate([
            dollarButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            dollarButton.trailingAnchor.constraint(equalTo: bottomLeftYLineLabel.leadingAnchor),
            
            friendShipButton.leadingAnchor.constraint(equalTo: bottomLeftYLineLabel.trailingAnchor),
            friendShipButton.trailingAnchor.constraint(equalTo: bottomCenterYLineLabel.leadingAnchor),
            
            marryButton.leadingAnchor.constraint(equalTo: bottomCenterYLineLabel.trailingAnchor),
            marryButton.trailingAnchor.constraint(equalTo: bottomRightYLineLabel.leadingAnchor),
            
            cardButton.leadingAnchor.constraint(equalTo: bottomRightYLineLabel.trailingAnchor),
            cardButton.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}
