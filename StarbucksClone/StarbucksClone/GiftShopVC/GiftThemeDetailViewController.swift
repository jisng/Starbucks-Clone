//
//  GiftThemeDetailViewController.swift
//  StarbucksClone
//
//  Created by 박지승 on 2020/03/11.
//  Copyright © 2020 Hailey. All rights reserved.
//

import UIKit

class GiftThemeDetailViewController: UIViewController {
    
    private let mainImageView = UIImageView()
    
    private let itemCollectionView = GiftCategoryCollectionView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
    
    private func setUI() {
        mainImageView.image = UIImage(named: "starbucks-logo")
        mainImageView.contentMode = .scaleAspectFit
    }
    
    private func setLayout() {
        let guide = view.safeAreaLayoutGuide
        [mainImageView, itemCollectionView].forEach({
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
            $0.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
        })
        NSLayoutConstraint.activate([
            mainImageView.topAnchor.constraint(equalTo: guide.topAnchor),
            mainImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.32),
            
            itemCollectionView.topAnchor.constraint(equalTo: mainImageView.bottomAnchor),
            itemCollectionView.bottomAnchor.constraint(equalTo: guide.bottomAnchor)
        ])
    }
}