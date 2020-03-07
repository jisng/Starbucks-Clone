//
//  GiftHomeController.swift
//  StarbucksClone
//
//  Created by 박지승 on 2020/03/06.
//  Copyright © 2020 Hailey. All rights reserved.
//

import UIKit

class GiftHomeController: UIViewController {
    
    private let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        tableView.rowHeight = 280
    }
    
    private func setUI() {
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.register(BannerTableViewCell.self,
                           forCellReuseIdentifier: BannerTableViewCell.identifier)
        tableView.register(TagTableViewCell.self,
                           forCellReuseIdentifier: TagTableViewCell.identifier)
        tableView.register(BestTableViewCell.self,
                           forCellReuseIdentifier: BestTableViewCell.identifier)
        tableView.register(ThemeTableViewCell.self,
                           forCellReuseIdentifier: ThemeTableViewCell.identifier)
        tableView.register(NewTableViewCell.self,
                           forCellReuseIdentifier: NewTableViewCell.identifier)
    }
    
    private func setLayout() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
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
