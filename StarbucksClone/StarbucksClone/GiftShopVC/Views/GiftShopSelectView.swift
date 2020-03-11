//
//  GiftShopSelectView.swift
//  StarbucksClone
//
//  Created by 박지승 on 2020/03/10.
//  Copyright © 2020 Hailey. All rights reserved.
//

import UIKit

protocol GiftShopSelectViewDelegate: class {
    func customMenuBar(buttonName: String)
}

class GiftShopSelectView: UIView {
    
    weak var delegate: GiftShopSelectViewDelegate?
    
    private let buttonStackView = UIStackView()
    private let selectLine = UILabel()
    
    private var lineLeading: NSLayoutConstraint?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func didTapButton(_ button: UIButton) {
        delegate?.customMenuBar(buttonName: button.currentTitle!)
        UIView.animate(withDuration: 0.3) {
            self.lineLeading?.constant = button.frame.minX
            self.layoutIfNeeded()
        }
    }
    
    private func setUI() {
        buttonStackView.axis = .horizontal
        buttonStackView.alignment = .center
        buttonStackView.distribution = .fillEqually
        
        let homeButton = UIButton()
        let categoryButton = UIButton()
        let giftBoxButton = UIButton()
        homeButton.setTitle("홈", for: .normal)
        categoryButton.setTitle("카테고리", for: .normal)
        giftBoxButton.setTitle("선물함", for: .normal)
        [homeButton, categoryButton, giftBoxButton].forEach({
            buttonStackView.addArrangedSubview($0)
            $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
            $0.setTitleColor(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), for: .normal)
            $0.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        })
        
        selectLine.backgroundColor = .brown
        
        dump(self.parentViewController)
//        guard let vc = self.parentViewController as? GiftShopController else { return }
//        vc.delegate = self
    }
    
    private func setLayout() {
        self.addSubview(buttonStackView)
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        buttonStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        buttonStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        buttonStackView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.95).isActive = true

        self.addSubview(selectLine)
        selectLine.translatesAutoresizingMaskIntoConstraints = false
        selectLine.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -1).isActive = true
        selectLine.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.05).isActive = true
        selectLine.widthAnchor.constraint(equalTo: buttonStackView.widthAnchor, multiplier: 0.333).isActive = true
        
        lineLeading = selectLine.leadingAnchor.constraint(equalTo: buttonStackView.leadingAnchor)
        lineLeading?.isActive = true
        
    }
    
}

extension GiftShopSelectView: GiftShopControllerDelegate {
    func movesSelectLine(offSet: CGFloat) {
        UIView.animate(withDuration: 0.1) {
            self.lineLeading?.constant = self.buttonStackView.bounds.minY + offSet
            self.layoutIfNeeded()
        }
    }
}


extension UIView {
  var parentViewController: UIViewController? {
    var responder: UIResponder? = self
    while let nextResponder = responder?.next {
      responder = nextResponder
      if let vc = nextResponder as? UIViewController {
        return vc
      }
    }
    return nil
  }
}

