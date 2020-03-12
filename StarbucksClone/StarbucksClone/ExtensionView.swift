//
//  ExtensionView.swift
//  StarbucksClone
//
//  Created by 박지승 on 2020/03/12.
//  Copyright © 2020 Hailey. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
  var parentNaviController: UINavigationController? {
    var responder: UIResponder? = self
    while let nextResponder = responder?.next {
      responder = nextResponder
      if let navi = nextResponder as? UINavigationController {
        return navi
      }
    }
    return nil
  }
}
