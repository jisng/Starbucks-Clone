//
//  ViewController.swift
//  StarbucksClone
//
//  Created by Hailey Lee on 2020/03/02.
//  Copyright © 2020 Hailey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let testView = GiftHomeTagView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(testView)
        testView.translatesAutoresizingMaskIntoConstraints = false
        testView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        testView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        testView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        testView.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: -200).isActive = true
    }


}

