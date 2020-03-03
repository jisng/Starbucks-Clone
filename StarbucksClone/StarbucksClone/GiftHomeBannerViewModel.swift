//
//  GiftHomeBannerViewModel.swift
//  StarbucksClone
//
//  Created by 박지승 on 2020/03/03.
//  Copyright © 2020 Hailey. All rights reserved.
//

import Foundation
import UIKit

class GiftHomeBannerViewModel {
    
    private let view: UIScrollView
    private let banner: UIButton
    private var timer: Timer?
    private var xOffSet: CGFloat = 0
    
    init(view: UIScrollView, banner: UIButton) {
        self.view = view
        self.banner = banner
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
        if xOffSet != view.frame.maxX*2 {
            xOffSet += banner.frame.maxX
            UIView.animate(withDuration: 1, delay: 0, animations: {
                self.view.contentOffset.x = self.xOffSet
            }, completion: nil)
        } else {
            UIView.animate(withDuration: 1, delay: 0, animations: {
                self.view.contentOffset.x = 0
            }, completion: nil)
            self.xOffSet = 0
        }
    }
}
