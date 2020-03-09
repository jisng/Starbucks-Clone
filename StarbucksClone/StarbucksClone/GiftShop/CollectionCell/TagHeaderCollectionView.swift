//
//  TagHeaderCollectionView.swift
//  StarbucksClone
//
//  Created by 박지승 on 2020/03/08.
//  Copyright © 2020 Hailey. All rights reserved.
//

import UIKit

class TagHeaderCollectionView: UICollectionReusableView {
    
    static let id = "TagHeader"
    
    var filterName = "인기순"
    
    private let tags = ["추천", "전체", "Love", "응원", "생일", "감사", "1-2만원대선물", "우정", "결혼", "출산/돌", "파티"]
    
    private let tagScrollView = UIScrollView()
    private let filterView = UIView()
    private let filterButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
        setButton()
    }
    
    override func layoutSubviews() {
        tagScrollView.layer.addViewBorder(edge: .bottom, color: .gray, thickness: 1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        tagScrollView.showsHorizontalScrollIndicator = false
        tagScrollView.backgroundColor = .white
        tagScrollView.showsHorizontalScrollIndicator = false
        
        filterView.backgroundColor = #colorLiteral(red: 0.9253896475, green: 0.9255482554, blue: 0.9253795743, alpha: 1)
        
        filterButton.setTitle(filterName, for: .normal)
        filterButton.setTitleColor(.gray, for: .normal)
        filterButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        filterButton.tintColor = .gray
        filterButton.semanticContentAttribute = .forceRightToLeft
        filterButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 10
        )
//        filterButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
    }
    
    private func setButton() {
        var buttons = [UIButton]()
        for tag in tags {
            let button = UIButton()
            button.setTitle(tag, for: .normal)
            button.setTitleColor(.gray, for: .normal)
            button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
            buttons.append(button)
        }
        
        for idx in 0..<buttons.count {
            tagScrollView.addSubview(buttons[idx])
            buttons[idx].translatesAutoresizingMaskIntoConstraints = false
            buttons[idx].topAnchor.constraint(equalTo: tagScrollView.topAnchor).isActive = true
            buttons[idx].bottomAnchor.constraint(equalTo: tagScrollView.bottomAnchor).isActive = true
            buttons[idx].heightAnchor.constraint(equalTo: tagScrollView.heightAnchor).isActive = true
            
            switch idx {
            case 0:
                buttons[idx].leadingAnchor.constraint(equalTo: tagScrollView.leadingAnchor, constant: 20).isActive = true
            case buttons.count-1:
                buttons[idx].trailingAnchor.constraint(equalTo: tagScrollView.trailingAnchor, constant: -20).isActive = true
                fallthrough
            default:
                buttons[idx].leadingAnchor.constraint(equalTo: buttons[idx-1].trailingAnchor, constant: 20).isActive = true
            }
        }
    }
    
    private func setLayout() {
        self.addSubview(tagScrollView)
        tagScrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tagScrollView.topAnchor.constraint(equalTo: self.topAnchor),
            tagScrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tagScrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tagScrollView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.6)
        ])
        
        self.addSubview(filterView)
        filterView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            filterView.topAnchor.constraint(equalTo: tagScrollView.bottomAnchor),
            filterView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            filterView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            filterView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        filterView.addSubview(filterButton)
        filterButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            filterButton.topAnchor.constraint(equalTo: filterView.topAnchor),
            filterButton.bottomAnchor.constraint(equalTo: filterView.bottomAnchor),
            filterButton.trailingAnchor.constraint(equalTo: filterView.trailingAnchor, constant: -12),
        ])
    }
}
