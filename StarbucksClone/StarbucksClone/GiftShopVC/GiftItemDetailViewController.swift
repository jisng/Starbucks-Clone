//
//  GiftItemDetailViewController.swift
//  StarbucksClone
//
//  Created by 박지승 on 2020/03/09.
//  Copyright © 2020 Hailey. All rights reserved.
//

import UIKit

struct GiftItem {
    let title: String
    let subtitle: String
    let price: Int
}

class GiftItemDetailViewController: UIViewController {
    
    var data = GiftItem(title: "카페 아메리카노", subtitle: "카페 아메리카노 1잔", price: 4100)
    
    private let contentsScrollView = UIScrollView()
//    private let itemDetailView = GiftItemDetailView()
    lazy var itemDetailView = GiftItemDetailView(item: data)
    private let spaceLineLabel = UILabel()
    private let suggestionView = GiftDetailSuggestionView()
    
    init(data: GiftItem) {
        self.data = data
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUI()
        setLayout()
    }
    
    override func viewWillLayoutSubviews() {
        let guide = view.safeAreaLayoutGuide
        itemDetailView.widthAnchor.constraint(equalTo: guide.widthAnchor).isActive = true
        itemDetailView.heightAnchor.constraint(equalTo: guide.heightAnchor, multiplier: 0.88).isActive = true
        spaceLineLabel.widthAnchor.constraint(equalTo: guide.widthAnchor).isActive = true
        spaceLineLabel.heightAnchor.constraint(equalTo: guide.heightAnchor, multiplier: 0.02).isActive = true
        suggestionView.widthAnchor.constraint(equalTo: guide.widthAnchor).isActive = true
        suggestionView.heightAnchor.constraint(equalTo: suggestionView.widthAnchor, multiplier: 0.72).isActive = true
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
