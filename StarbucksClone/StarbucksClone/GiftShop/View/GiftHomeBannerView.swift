//
//  GiftHomeBannerView.swift
//  StarbucksClone
//
//  Created by 박지승 on 2020/03/03.
//  Copyright © 2020 Hailey. All rights reserved.
//

import UIKit

class GiftHomeBannerView: UIScrollView {
    
    private var timer: Timer?
    private var xOffSet: CGFloat = 0
    
    private let bannerButton1 = UIButton()
    private let bannerButton2 = UIButton()
    private let bannerButton3 = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
        autoScroll()
    }
    
//    override func layoutSubviews() {
//        [bannerButton1,bannerButton2,bannerButton3].forEach({
//            $0.widthAnchor.constraint(equalToConstant: self.bounds.width).isActive = true
//        })
//    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func autoScroll() {
        if timer == nil {
          let timer = Timer(timeInterval: 3.0,
                            target: self,
                            selector: #selector(timerAction),
                            userInfo: nil,
                            repeats: true)
          RunLoop.current.add(timer, forMode: .common)
          timer.tolerance = 0.1
          
          self.timer = timer
        }
    }
    
    @objc private func timerAction() {
        if xOffSet != self.frame.maxX*2 {
            xOffSet += bannerButton1.frame.maxX
            UIView.animate(withDuration: 1, delay: 0, animations: {
                self.contentOffset.x = self.xOffSet
            }, completion: nil)
        } else {
            UIView.animate(withDuration: 1, delay: 0, animations: {
                self.contentOffset.x = 0
            }, completion: nil)
            self.xOffSet = 0
        }
    }
    
    private func setUI() {
        self.isPagingEnabled = true
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
        
        [bannerButton1, bannerButton2, bannerButton3].forEach({
            $0.setImage(UIImage(named: "starbucks-logo"), for: .normal)
        })
        bannerButton1.backgroundColor = .white
        bannerButton2.backgroundColor = .gray
        bannerButton3.backgroundColor = .black
    }
    
    private func setLayout() {
        [bannerButton1,bannerButton2,bannerButton3].forEach({
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            $0.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
            $0.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
            $0.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        })
        bannerButton1.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        bannerButton2.leadingAnchor.constraint(equalTo: bannerButton1.trailingAnchor).isActive = true
        bannerButton3.leadingAnchor.constraint(equalTo: bannerButton2.trailingAnchor).isActive = true
        bannerButton3.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
}
