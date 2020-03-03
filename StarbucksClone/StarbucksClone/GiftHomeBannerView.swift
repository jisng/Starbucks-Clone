//
//  GiftHomeBannerView.swift
//  StarbucksClone
//
//  Created by 박지승 on 2020/03/03.
//  Copyright © 2020 Hailey. All rights reserved.
//

import UIKit

class GiftHomeBannerView: UIScrollView {
    
    lazy var model = GiftHomeBannerViewModel(view: self, banner: self.bannerButton1)
    
    private let bannerButton1 = UIButton()
    private let bannerButton2 = UIButton()
    private let bannerButton3 = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
        model.autoScroll()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
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
            $0.widthAnchor.constraint(equalTo: superview?.widthAnchor ?? self.widthAnchor).isActive = true
        })
        bannerButton1.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        bannerButton2.leadingAnchor.constraint(equalTo: bannerButton1.trailingAnchor).isActive = true
        bannerButton3.leadingAnchor.constraint(equalTo: bannerButton2.trailingAnchor).isActive = true
        bannerButton3.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
    }
}
