//
//  GiftHomeView.swift
//  StarbucksClone
//
//  Created by 박지승 on 2020/03/03.
//  Copyright © 2020 Hailey. All rights reserved.
//

import UIKit

class GiftHomeView: UIScrollView {
    /*
     총 5개의 뷰가 와야함
     1. GiftHomeBannerView
     2. GiftHomeTagView
     3. GiftHomeBestView
     4. GiftHomeThemeView
     5. GiftHomeNewView
     */
    
    private let bannerView = GiftHomeBannerView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        
    }
    
    private func setLayout() {
        
    }
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
