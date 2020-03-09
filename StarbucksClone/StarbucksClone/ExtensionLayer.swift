//
//  ExtensionLayer.swift
//  StarbucksClone
//
//  Created by 박지승 on 2020/03/08.
//  Copyright © 2020 Hailey. All rights reserved.
//

import Foundation
import UIKit

extension CALayer {
    
    func addBorder(edge: UIRectEdge, color: UIColor, thickness: CGFloat) {
        let border = CALayer()
        let lineWidth = frame.width * 0.8
        
        switch edge {
        case .bottom:
            border.frame = CGRect(x: (frame.width - lineWidth) / 2,
                                  y: frame.height - thickness,
                                  width: lineWidth,
                                  height: thickness)
        case .left:
            border.frame = CGRect(x: -5,
                                  y: 0,
                                  width: thickness,
                                  height: frame.height)
        case .right:
            border.frame = CGRect(x: frame.width + 5 ,
                                  y: 0,
                                  width: thickness,
                                  height: frame.height + 10)
        default:
            break
        }
        border.backgroundColor = color.cgColor
        addSublayer(border)
    }
    
    func addViewBorder(edge: UIRectEdge, color: UIColor, thickness: CGFloat) {
        let border = CALayer()
        
        switch edge {
        case .bottom:
            border.frame = CGRect(x: 0,
                                  y: frame.height - thickness,
                                  width: frame.width,
                                  height: thickness)
        default:
            break
        }
        border.backgroundColor = color.cgColor
        addSublayer(border)
    }
}
