//
//  GiftHomeView.swift
//  StarbucksClone
//
//  Created by 박지승 on 2020/03/10.
//  Copyright © 2020 Hailey. All rights reserved.
//

import UIKit

class GiftHomeView: UIView {
    
    private let homeTableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        homeTableView.backgroundColor = .white
        homeTableView.dataSource = self
        homeTableView.delegate = self
        
        homeTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        homeTableView.register(BannerTableViewCell.self,
                               forCellReuseIdentifier: BannerTableViewCell.identifier)
        homeTableView.register(TagTableViewCell.self,
                               forCellReuseIdentifier: TagTableViewCell.identifier)
        homeTableView.register(BestTableViewCell.self,
                               forCellReuseIdentifier: BestTableViewCell.identifier)
        homeTableView.register(ThemeTableViewCell.self,
                               forCellReuseIdentifier: ThemeTableViewCell.id)
        homeTableView.register(NewTableViewCell.self,
                               forCellReuseIdentifier: NewTableViewCell.identifier)
    }
    
    private func setLayout() {
        homeTableView.backgroundColor = .white
        self.addSubview(homeTableView)
        homeTableView.translatesAutoresizingMaskIntoConstraints = false
        homeTableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        homeTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        homeTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        homeTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}

extension GiftHomeView: UITableViewDataSource {
    
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
            let cell = tableView.dequeueReusableCell(withIdentifier: ThemeTableViewCell.id, for: indexPath) as! ThemeTableViewCell
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

extension GiftHomeView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return CGFloat(self.bounds.height * 0.24)
        case 1:
            return CGFloat(self.bounds.height * 0.28)
        case 3:
            return CGFloat(self.bounds.height * 0.60)
        default:
            return CGFloat(self.bounds.height * 0.36)
        }
    }
}
