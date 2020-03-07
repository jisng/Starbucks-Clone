//
//  ViewController.swift
//  StarbucksClone
//
//  Created by Hailey Lee on 2020/03/02.
//  Copyright © 2020 Hailey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let homeView = GiftHomeBestNewView(titleText: "BEST", subTitleText: "....")
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        homeLayout()
    }
    
    override func viewWillLayoutSubviews() {
        homeLayout()
    }
    
    private func homeLayout() {
        view.addSubview(homeView)
        homeView.translatesAutoresizingMaskIntoConstraints = false
        homeView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        homeView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        homeView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        homeView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        homeView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        homeView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
//
//    private func setScrollView() {
//        scrollView.backgroundColor = .systemPink
//        view.addSubview(scrollView)
//        scrollView.translatesAutoresizingMaskIntoConstraints = false
//        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//
//        bannerViews.backgroundColor = .yellow
//        scrollView.addSubview(bannerViews)
//        bannerViews.translatesAutoresizingMaskIntoConstraints = false
//        bannerViews.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
//        bannerViews.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
//        bannerViews.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
//        bannerViews.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.5).isActive = true
//        bannerViews.bottomAnchor.constraint(equalTo: scrollView.centerYAnchor).isActive = true
//
//        let bannerView = GiftHomeBannerView()
//        bannerViews.addSubview(bannerView)
//        bannerView.translatesAutoresizingMaskIntoConstraints = false
//        bannerView.topAnchor.constraint(equalTo: bannerViews.topAnchor).isActive = true
//        bannerView.leadingAnchor.constraint(equalTo: bannerViews.leadingAnchor).isActive = true
//        bannerView.trailingAnchor.constraint(equalTo: bannerViews.trailingAnchor).isActive = true
//        bannerView.bottomAnchor.constraint(equalTo: bannerViews.bottomAnchor).isActive = true
//    }
//
//    private func bannerLayout() {
//        let bannerView = GiftHomeBannerView()
//        scrollView.addSubview(bannerView)
//        bannerView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
//        bannerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
//        bannerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
//        bannerView.bottomAnchor.constraint(equalTo: scrollView.centerYAnchor).isActive = true
//    }
//
    
//
//    private func subViewsLayout() {
//        homeView.addSubview(bannerView)
//        bannerView.translatesAutoresizingMaskIntoConstraints = false
//        bannerView.topAnchor.constraint(equalTo: homeView.topAnchor).isActive = true
//        bannerView.leadingAnchor.constraint(equalTo: homeView.leadingAnchor).isActive = true
//        bannerView.trailingAnchor.constraint(equalTo: homeView.trailingAnchor).isActive = true
//        bannerView.bottomAnchor.constraint(equalTo: homeView.bottomAnchor).isActive = true
//    }
}

//
//    private let testView = GiftHomeView()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        testView.backgroundColor = .white
//        view.addSubview(testView)
//        testView.translatesAutoresizingMaskIntoConstraints = false
//        testView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
//        testView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
////        testView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
////
//        testView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        testView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//    }
//
