//
//  GiftShopController.swift
//  StarbucksClone
//
//  Created by 박지승 on 2020/03/10.
//  Copyright © 2020 Hailey. All rights reserved.
//

import UIKit

class GiftShopController: UIViewController {
    
    private let selectView = GiftShopSelectView()
    private let scrollView = UIScrollView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setViewsLayout()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        selectView.layer.addViewBorder(edge: .bottom, color: .gray, thickness: 1)
    }
    
    private func setUI() {
        scrollView.isPagingEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
    }
    
    private func setViewsLayout() {
        let homeView = GiftHomeView()
        let categoryView = GiftCategoryView()
        let giftBoxView = GiftBoxView()
        
        scrollView.addSubview(homeView)
        homeView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            homeView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            homeView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            homeView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            homeView.widthAnchor.constraint(equalToConstant: view.bounds.width),
            homeView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
        ])
        
        
        scrollView.addSubview(categoryView)
        categoryView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            categoryView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            categoryView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            categoryView.leadingAnchor.constraint(equalTo: homeView.trailingAnchor),
//            categoryView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            categoryView.widthAnchor.constraint(equalTo: homeView.widthAnchor),
            categoryView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        ])

        scrollView.addSubview(giftBoxView)
        giftBoxView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            giftBoxView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            giftBoxView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            giftBoxView.leadingAnchor.constraint(equalTo: categoryView.trailingAnchor),
            giftBoxView.widthAnchor.constraint(equalTo: categoryView.widthAnchor),
            giftBoxView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            giftBoxView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor)
        ])
    }
    
    private func setLayout() {
        let guide = view.safeAreaLayoutGuide
        [selectView, scrollView].forEach({
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
            $0.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
        })
        
        selectView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        selectView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.06).isActive = true
        
        scrollView.topAnchor.constraint(equalTo: selectView.bottomAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
    }
    
}
