//
//  GiftDetailViewController.swift
//  StarbucksClone
//
//  Created by 박지승 on 2020/03/09.
//  Copyright © 2020 Hailey. All rights reserved.
//

import UIKit

class GiftDetailViewController: UIViewController {
    
    private let contentsScrollView = UIScrollView()
    private let itemDetailView = GiftDetailItemView()
    private let spaceLineLabel = UILabel()
    private let suggestionView = GiftDetailSuggestionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
    override func viewWillLayoutSubviews() {
        itemDetailView.widthAnchor.constraint(equalToConstant: view.bounds.width * 0.9).isActive = true
        itemDetailView.heightAnchor.constraint(equalToConstant: view.bounds.height * 0.72).isActive = true
        spaceLineLabel.widthAnchor.constraint(equalToConstant: view.bounds.width).isActive = true
        spaceLineLabel.heightAnchor.constraint(equalToConstant: view.bounds.height * 0.02).isActive = true
        suggestionView.widthAnchor.constraint(equalToConstant: view.bounds.width * 0.9).isActive = true
        suggestionView.heightAnchor.constraint(equalTo: suggestionView.widthAnchor, multiplier: 0.8).isActive = true
    }
    
    private func setUI() {
        spaceLineLabel.backgroundColor = #colorLiteral(red: 0.9215686275, green: 0.9215686275, blue: 0.9098039216, alpha: 1)
    }
    
    private func setLayout() {
        
        let guide = view.safeAreaLayoutGuide
        view.addSubview(contentsScrollView)
        contentsScrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentsScrollView.topAnchor.constraint(equalTo: guide.topAnchor),
            contentsScrollView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            contentsScrollView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            contentsScrollView.bottomAnchor.constraint(equalTo: guide.bottomAnchor)
        ])
        
        contentsScrollView.addSubview(itemDetailView)
        itemDetailView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            itemDetailView.topAnchor.constraint(equalTo: contentsScrollView.topAnchor),
            itemDetailView.centerXAnchor.constraint(equalTo: contentsScrollView.centerXAnchor)
        ])
        
        contentsScrollView.addSubview(spaceLineLabel)
        spaceLineLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            spaceLineLabel.topAnchor.constraint(equalTo: itemDetailView.bottomAnchor),
            spaceLineLabel.leadingAnchor.constraint(equalTo: contentsScrollView.leadingAnchor),
            spaceLineLabel.trailingAnchor.constraint(equalTo: contentsScrollView.trailingAnchor),
        ])
        
        contentsScrollView.addSubview(suggestionView)
        suggestionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            suggestionView.topAnchor.constraint(equalTo: spaceLineLabel.bottomAnchor),
            suggestionView.centerXAnchor.constraint(equalTo: contentsScrollView.centerXAnchor),
            suggestionView.bottomAnchor.constraint(equalTo: contentsScrollView.bottomAnchor)
        ])
        
    }
}
