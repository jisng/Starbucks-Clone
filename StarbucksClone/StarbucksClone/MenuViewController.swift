//
//  MenuViewController.swift
//  StarbucksClone
//
//  Created by Hailey Lee on 2020/03/07.
//  Copyright © 2020 Hailey. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    let testLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
    private func setUI() {
        view.backgroundColor = .white
        testLabel.text = "제발 나와주세요"
        testLabel.backgroundColor = .white
        testLabel.textColor = .black
        testLabel.textAlignment = .left
        testLabel.font = UIFont.systemFont(ofSize: 24)
        view.addSubview(testLabel)
    }

    private func setLayout() {
        let guide = self.view.safeAreaLayoutGuide
        
        testLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            testLabel.topAnchor.constraint(equalTo: guide.topAnchor,constant: 0),
            testLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 0),
            testLabel.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: 0),
            testLabel.heightAnchor.constraint(equalTo: guide.heightAnchor, multiplier: 0.06)
        ])
    }

}
