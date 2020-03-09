//
//  GiftHomeBestItemView.swift
//  StarbucksClone
//
//  Created by 박지승 on 2020/03/05.
//  Copyright © 2020 Hailey. All rights reserved.
//

//import UIKit
//
//class GiftHomeBestItemView: UIView {
//    
//    private let itemButton = UIButton()
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setUI(image: "starbucks-logo", text: "starbucks")
//        setLayout()
//    }
//    
//    convenience init (image: String, text: String) {
//        self.init()
//        setUI(image: image, text: text)
//        setLayout()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    override func layoutSubviews() {
//        
//        guard let imageWidth = itemButton.imageView?.frame.width,
//            let titleHeight = itemButton.titleLabel?.frame.height
//        else { return }
//        itemButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: titleHeight*2, right: 0)
//        itemButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: -imageWidth, bottom: 0, right: 0)
//        itemButton.widthAnchor.constraint(equalToConstant: imageWidth).isActive = true
//    }
//    
//    private func setUI(image: String, text: String) {
//        self.clipsToBounds = true
//        
//        itemButton.backgroundColor = .blue
//        itemButton.contentMode = .scaleAspectFill
//        
//        itemButton.setImage(UIImage(named: image), for: .normal)
//        itemButton.setTitle(text, for: .normal)
//        itemButton.setTitleColor(.darkGray, for: .normal)
//        
//        itemButton.imageView?.layer.cornerRadius = 16
//        itemButton.imageView?.backgroundColor = .lightGray
//        itemButton.imageView?.contentMode = .scaleAspectFit
//        
//        itemButton.contentHorizontalAlignment = .center
//        itemButton.contentVerticalAlignment = .bottom
//    }
//    
//    private func setLayout() {
//        self.addSubview(itemButton)
//        itemButton.translatesAutoresizingMaskIntoConstraints = false
//        itemButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
//        itemButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
//    }
//}
