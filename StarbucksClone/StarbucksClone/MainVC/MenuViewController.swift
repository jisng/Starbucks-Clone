//
//  MenuViewController.swift
//  StarbucksClone
//
//  Created by Hailey Lee on 2020/03/07.
//  Copyright © 2020 Hailey. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    let nameLabel = UILabel()
    let levelLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    private func setUI() {
        view.backgroundColor = .white
        
        nameLabel.text = "안나"
        nameLabel.textColor = .black
        nameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        levelLabel.text = "Welcome Level"
        levelLabel.textColor = .systemGray
        levelLabel.font = UIFont.boldSystemFont(ofSize: 16)
        
        [nameLabel, levelLabel].forEach {
        view.addSubview($0)
        }
    }

    private func setLayout() {
        let guide = self.view.safeAreaLayoutGuide
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: guide.topAnchor,constant: 12),
            nameLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 12),
            nameLabel.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: 0)
        ])
        
        levelLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            levelLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor,constant: 6),
            levelLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 12),
            levelLabel.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: 0)
        ])
    }

}
