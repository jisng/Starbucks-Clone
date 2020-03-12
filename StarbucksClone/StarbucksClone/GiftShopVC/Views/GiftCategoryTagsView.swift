//
//  GiftCategoryTagsView.swift
//  StarbucksClone
//
//  Created by 박지승 on 2020/03/10.
//  Copyright © 2020 Hailey. All rights reserved.
//

import UIKit

protocol GiftCategoryTagsViewDelegate: class {
    func moveScrollView(idx: Int)
}

class GiftCategoryTagsView: UIView {
    
    weak var delegate: GiftCategoryTagsViewDelegate?
    
    var filterName = "인기순"
    
    let tags = ["  추천  ", "  전체  ", "  Love  ", "  응원  ", "  생일  ", "  감사  ", "  1-2만원대선물  ", "  우정  ", "  결혼  ", "  출산/돌  ", "  파티  "]
    
    private let tagScrollView = UIScrollView()
    private var tagButtons = [UIButton]()
    
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
        filterView.layer.addViewBorder(edge: .top, color: .gray, thickness: 1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func didTapTagButton(_ button: UIButton) {
        
        if tagScrollView.contentOffset.x < tagScrollView.contentSize.width - self.bounds.width {
            UIView.animate(withDuration: 0.3) {
                self.tagScrollView.contentOffset.x += button.bounds.width + 10
            }
        }
        delegate?.moveScrollView(idx: tags.firstIndex(of: button.currentTitle ?? "추천") ?? 0)
        
        self.setSelectedEffect(button.tag)
        
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
        
        for (index, tag) in tags.enumerated() {
            let button = UIButton()
            button.tag = index
            button.setTitle(tag, for: .normal)
            button.setTitleColor(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), for: .normal)
            button.setTitleColor(.white, for: .selected)
            button.titleLabel?.font = .systemFont(ofSize: 14, weight: .semibold)
            
            button.layer.cornerRadius = 14
            button.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner,
                                     .layerMinXMaxYCorner, .layerMinXMinYCorner]
            
            ButtonToScroll.shared.detailButtons.append(button)
            button.addTarget(self, action: #selector(didTapTagButton(_:)), for: .touchUpInside)
            tagButtons.append(button)
        }
        
        for button in tagButtons {
            let selectView = UIView()
            selectView.backgroundColor = .yellow
            tagScrollView.addSubview(selectView)
            selectView.frame = CGRect(x: button.frame.minX, y: button.frame.minY,
                                      width: button.frame.width, height: button.frame.height)
        }
        
        for idx in 0..<tagButtons.count {
            tagScrollView.addSubview(tagButtons[idx])
            tagButtons[idx].translatesAutoresizingMaskIntoConstraints = false
            tagButtons[idx].centerYAnchor.constraint(equalTo: tagScrollView.centerYAnchor).isActive = true
            
            switch idx {
            case 0:
                tagButtons[idx].leadingAnchor.constraint(equalTo: tagScrollView.leadingAnchor, constant: 20).isActive = true
            case tagButtons.count-1:
                tagButtons[idx].trailingAnchor.constraint(equalTo: tagScrollView.trailingAnchor, constant: -20).isActive = true
                fallthrough
            default:
                tagButtons[idx].leadingAnchor.constraint(equalTo: tagButtons[idx-1].trailingAnchor, constant: 20).isActive = true
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

extension GiftCategoryTagsView: GiftCategoryViewDelegate {
    func moveTagsView(offSet: CGFloat) {
        UIView.animate(withDuration: 0.3) {
            self.tagScrollView.contentOffset.x = offSet
        }
    }
    
    func moveTagsView(idx: Int) {
        self.setSelectedEffect(idx)
    }
    
    private func setSelectedEffect(_ idx: Int) {
        tagButtons.enumerated().forEach {
            let isSelected = $0.offset == idx
            $0.element.setTitleColor(isSelected ? .white : #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), for: .normal)
            $0.element.backgroundColor = isSelected ? #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1) : .white
        }
    }
    
}
