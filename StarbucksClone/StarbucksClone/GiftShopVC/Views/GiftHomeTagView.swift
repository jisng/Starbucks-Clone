//
//  GiftHomeTagView.swift
//  StarbucksClone
//
//  Created by 박지승 on 2020/03/03.
//  Copyright © 2020 Hailey. All rights reserved.
//

import UIKit

//protocol GiftHomeTagViewDelegate: class {
//    func selectCategoryTagButton(buttonName: String)
//}

class GiftHomeTagView: GiftHomeTagLineView {
    
//    weak var delegate: GiftHomeTagViewDelegate?
    
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
    
    @objc func didTapButton (_ button: UIButton) {
       
        Test.shared.categoryButtons.first?.sendActions(for: .touchUpInside)
        
        for b in Test.shared.detailButtons {
            if b.currentTitle == button.currentTitle {
                guard let idx = Test.shared.detailButtons.firstIndex(of: b) else { return }
                Test.shared.detailButtons[idx].sendActions(for: .touchUpInside)
            }
        }
        
//        delegate?.selectCategoryTagButton(buttonName: button.currentTitle ?? "")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        [loveButton, cheerButton, birthButton, thanksButton, dollarButton, friendShipButton, marryButton, cardButton].forEach({
            $0.setTitleColor(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 12)
            $0.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        })
        
        loveButton.setTitle("Love", for: .normal)
        cheerButton.setTitle("응원", for: .normal)
        birthButton.setTitle("생일", for: .normal)
        thanksButton.setTitle("감사", for: .normal)
        dollarButton.setTitle("1-2만원대선물", for: .normal)
        friendShipButton.setTitle("우정", for: .normal)
        marryButton.setTitle("결혼", for: .normal)
        cardButton.setTitle("e-Gift Card", for: .normal)
    }
    
    private func setLayout() {
        [loveButton, cheerButton, birthButton, thanksButton].forEach({
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                $0.topAnchor.constraint(equalTo: self.topAnchor),
                $0.bottomAnchor.constraint(equalTo: centerXLineLabel.topAnchor)
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
                $0.topAnchor.constraint(equalTo: centerXLineLabel.bottomAnchor),
                $0.bottomAnchor.constraint(equalTo: self.bottomAnchor)
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
