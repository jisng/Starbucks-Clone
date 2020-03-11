//
//  SirenOrderViewController.swift
//  StarbuckCloneEx2
//
//  Created by Mac mini on 2020/03/04.
//  Copyright © 2020 Mac mini. All rights reserved.
//

import UIKit

class SirenOrderViewController: UIViewController {
  
  var tableView = UITableView()
  let titles = ["안나님을 위한 추천 메뉴", "새로 나온 메뉴", "함꼐 하면 좋은 푸드 메뉴"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
//    setNavigationBar()
    setup()
    setAutoLayout()
  }
  
  func setNavigationBar() {
    view.backgroundColor = .white
    title = "사이렌 오더"
    navigationController?.navigationBar.barStyle = .black
    navigationController?.navigationBar.backgroundColor = .black
    navigationController?.navigationBar.tintColor = .white
    
    let searchBarButton: UIButton = {
      let searchBarButton = UIButton()
      searchBarButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
      searchBarButton.imageView?.contentMode = .scaleToFill
      searchBarButton.frame = CGRect(x: 10, y: 0, width: 10, height: 10)
      searchBarButton.addTarget(self, action: #selector(didTapSearchBarButton(_:)), for: .touchUpInside)
      return searchBarButton
    }()
    
    let orderListBarButton: UIButton = {
      let orderListBarButton = UIButton()
      orderListBarButton.setImage(UIImage(systemName: "bag"), for: .normal)
      orderListBarButton.imageView?.contentMode = .scaleToFill
      orderListBarButton.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
      orderListBarButton.addTarget(self, action: #selector(didTapOrderListBarButton (_:)), for: .touchUpInside)
      return orderListBarButton
    }()
  //      let orderListBarButton = UIBarButtonItem(image: UIImage(systemName: "bag"), style: .done, target: self, action:  #selector(didTapOrderListBarButton (_:)))
    navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: orderListBarButton), UIBarButtonItem(customView: searchBarButton)]
  }
  
  func setup() {
    view.addSubview(tableView)
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(TopBannerTableViewCell.self, forCellReuseIdentifier: TopBannerTableViewCell.identifier)
    tableView.register(SirenOrderTableViewCell.self, forCellReuseIdentifier: SirenOrderTableViewCell.identifier)
    tableView.register(SirenOrderMenuStoryTableViewCell.self, forCellReuseIdentifier: SirenOrderMenuStoryTableViewCell.identifier)
    //tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
  }
  
  func setAutoLayout() {
    let guide = view.safeAreaLayoutGuide
    //let margin: CGFloat = 5
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: guide.topAnchor),
      tableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
      tableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor),
    ])
  }
  
  
  @objc private func didTapSearchBarButton(_ sender: Any) {
    
  }
  
  @objc private func didTapOrderListBarButton(_ sender: Any) {
    
  }
}

extension SirenOrderViewController: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    3
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    if section == 1 {
      return 80
    } else {
      return 0
    }
  }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    if section == 1 {
      let headerView = MenuSectionHeaderView()
      return headerView
    } else {
      return nil
    }
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if section == 1 {
      return 3
    } else {
      return 1
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if indexPath.section == 0 {
      let cell = tableView.dequeueReusableCell(withIdentifier: TopBannerTableViewCell.identifier, for: indexPath) as! TopBannerTableViewCell
      return cell
      
    } else if indexPath.section == 1 {
      // 추천메뉴, 새로 나온 메뉴, 함께 하면 좋은 푸드 메뉴, 메뉴 이야기
      let cell = tableView.dequeueReusableCell(withIdentifier: SirenOrderTableViewCell.identifier, for: indexPath) as! SirenOrderTableViewCell
      cell.configure(title: titles[indexPath.row])
      cell.selectionStyle = .none
      return cell
      
    } else {
      let cell = tableView.dequeueReusableCell(withIdentifier: SirenOrderMenuStoryTableViewCell.identifier, for: indexPath) as! SirenOrderMenuStoryTableViewCell
      return cell
    }
    
  }
}

extension SirenOrderViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    if indexPath.section == 0 {
      return 155
    } else if indexPath.section == 1 {
      return 250
    } else {
      return 200
    }
  }
  
 
  
  
}
