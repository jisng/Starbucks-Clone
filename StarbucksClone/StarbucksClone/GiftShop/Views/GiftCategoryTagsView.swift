//
//  GiftCategoryTagsView.swift
//  StarbucksClone
//
//  Created by 박지승 on 2020/03/10.
//  Copyright © 2020 Hailey. All rights reserved.
//

import UIKit

class GiftCategoryTagsView: UIView {
    
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
        super.layoutSubviews()
        tagScrollView.layer.addViewBorder(edge: .bottom, color: .gray, thickness: 1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func didTapTagButton(_ button: UIButton) {
        if UIScreen.main.bounds.maxX != button.frame.maxX {
            UIView.animate(withDuration: 0.3) {
                self.tagScrollView.contentOffset.x += 40
            }
        }
    }
    
    private func setUI() {
        tagScrollView.showsHorizontalScrollIndicator = false
        tagScrollView.backgroundColor = .white
        tagScrollView.showsHorizontalScrollIndicator = false
        
        filterView.backgroundColor = #colorLiteral(red: 0.9253896475, green: 0.9255482554, blue: 0.9253795743, alpha: 1)
        
        filterButton.setTitle(filterName, for: .normal)
        filterButton.setTitleColor(.gray, for: .normal)
        filterButton.titleLabel?.font = .systemFont(ofSize: 12, weight: .medium)
        filterButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        filterButton.tintColor = .gray
        filterButton.semanticContentAttribute = .forceRightToLeft
        filterButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 0)
    }
    
    private func setButton() {
        var buttons = [UIButton]()
        
        for tag in tags {
            let button = UIButton()
            button.setTitle(tag, for: .normal)
            button.setTitleColor(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), for: .normal)
            button.titleLabel?.font = .systemFont(ofSize: 14, weight: .semibold)
            button.addTarget(self, action: #selector(didTapTagButton(_:)), for: .touchUpInside)
            buttons.append(button)
        }
        
        for button in buttons {
            let selectView = UIView()
            selectView.backgroundColor = .yellow
            tagScrollView.addSubview(selectView)
            selectView.frame = CGRect(x: button.frame.minX, y: button.frame.minY,
                                      width: button.frame.width, height: button.frame.height)
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
