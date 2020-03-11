//
//  NotificationViewController.swift
//  StarbucksClone
//
//  Created by Hailey Lee on 2020/03/10.
//  Copyright © 2020 Hailey. All rights reserved.
//

import UIKit
import SideMenu

class NotificationViewController: UIViewController {

    
//    let notificationVC = UINavigationController(rootViewController: NotificationViewController())
    
    let customSideMenuManager = SideMenuManager()
    
    let titleLabel = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
        setLayout()
       
        
    }
           
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("성공")
    }
    private func setUI() {
        view.backgroundColor = .white
        
        titleLabel.text = "왜 안나오는 거냐 도데체"
        titleLabel.textColor = .black
        
        view.addSubview(titleLabel)
        
//        notificationVC.navigationBar.barStyle = .white
//        notificationVC.navigationBar.backgroundColor = .red // 안나온ㄷ
//        notificationVC.navigationBar.tintColor = .black
//        notificationVC.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
        
        self.navigationItem.title = "알림"
        
    }

    private func setLayout() {
        
        let guide = self.view.safeAreaLayoutGuide
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: guide.topAnchor,constant: 0),
            titleLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 0),
            titleLabel.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: 0),
            titleLabel.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: 0)
        ])
        
    }

}
