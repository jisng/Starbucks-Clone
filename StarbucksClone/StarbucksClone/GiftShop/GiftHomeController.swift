//
//  GiftHomeController.swift
//  StarbucksClone
//
//  Created by 박지승 on 2020/03/06.
//  Copyright © 2020 Hailey. All rights reserved.
//

import UIKit

class GiftHomeController: UIViewController {
    
    private let homeTableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        homeTableView.rowHeight = 280
    }
    
    private func setUI() {
        homeTableView.dataSource = self
        homeTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        homeTableView.register(BannerTableViewCell.self,
                           forCellReuseIdentifier: BannerTableViewCell.identifier)
        homeTableView.register(TagTableViewCell.self,
                           forCellReuseIdentifier: TagTableViewCell.identifier)
        homeTableView.register(BestTableViewCell.self,
                           forCellReuseIdentifier: BestTableViewCell.identifier)
        homeTableView.register(ThemeTableViewCell.self,
                           forCellReuseIdentifier: ThemeTableViewCell.identifier)
        homeTableView.register(NewTableViewCell.self,
                           forCellReuseIdentifier: NewTableViewCell.identifier)
    }
    
    private func setLayout() {
        view.addSubview(homeTableView)
        homeTableView.translatesAutoresizingMaskIntoConstraints = false
        homeTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        homeTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        homeTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        homeTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
}

extension GiftHomeController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: BannerTableViewCell.identifier, for: indexPath) as! BannerTableViewCell
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: TagTableViewCell.identifier, for: indexPath) as! TagTableViewCell
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: BestTableViewCell.identifier, for: indexPath) as! BestTableViewCell
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: ThemeTableViewCell.identifier, for: indexPath) as! ThemeTableViewCell
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: NewTableViewCell.identifier, for: indexPath) as! NewTableViewCell
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            cell.textLabel?.text = "default"
            return cell
        }
    }
}
