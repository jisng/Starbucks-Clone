//
//  GiftThemeDetailViewController.swift
//  StarbucksClone
//
//  Created by 박지승 on 2020/03/11.
//  Copyright © 2020 Hailey. All rights reserved.
//

import UIKit

class GiftThemeDetailViewController: UIViewController {
    
    private var itemData = [GiftItem]()
    
    private let mainImageView = UIImageView()
    
    lazy var itemCollectionView = GiftCategoryCollectionView(data: itemData)
    
    init(imageName: String, data: [GiftItem]) {
        mainImageView.image = UIImage(named: imageName)
        itemData = data
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
    
    private func setUI() {
        mainImageView.contentMode = .scaleAspectFill
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
            mainImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.34),
            
            itemCollectionView.topAnchor.constraint(equalTo: mainImageView.bottomAnchor),
            itemCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
