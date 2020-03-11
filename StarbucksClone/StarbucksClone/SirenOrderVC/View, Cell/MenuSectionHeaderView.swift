//
//  MenuSectionHeaderView.swift
//  StarbuckCloneEx2
//
//  Created by Mac mini on 2020/03/07.
//  Copyright © 2020 Mac mini. All rights reserved.
//

import UIKit

class MenuSectionHeaderView: UIView {
  let menuButton1 = UIButton()  // 전체메뉴
  let menuButton2 = UIButton()  // 마이메뉴
  let menuButton3 = UIButton()  // 히스토리

  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
    setAutolayout()
    print("실행")
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  @objc func didTapButton1() {
    //    let sirenOrderVC = SirenOrderViewController()
    //    navigationController?.pushViewController(sirenOrderVC, animated: true)
    //let allMenuVC = AllMeneViewController()
    // delegate 쓰기!!!
    
     print("전체메뉴 선택됨!")
   }
   @objc func didTapButton2() {
     print("마이메뉴 선택됨!")
   }
   @objc func didTapButton3() {
     print("히스토리 선택됨!")
   }
  
  func setup() {
    self.addSubview(menuButton1)
    self.addSubview(menuButton2)
    self.addSubview(menuButton3)
    
    menuButton1.setImage(UIImage(named: "SirenOrderMenu1"), for: .normal)
    menuButton1.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    menuButton1.addTarget(self, action: #selector(didTapButton1), for: .touchUpInside)
    
    menuButton2.setImage(UIImage(named: "SirenOrderMenu2"), for: .normal)
    menuButton2.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    menuButton2.addTarget(self, action: #selector(didTapButton2), for: .touchUpInside)
    
    menuButton3.setImage(UIImage(named: "SirenOrderMenu3"), for: .normal)
    menuButton3.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    menuButton3.addTarget(self, action: #selector(didTapButton3), for: .touchUpInside)
    
  }
  
  func setAutolayout() {
    [menuButton1, menuButton2, menuButton3].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
    let viewWidth = UIScreen.main.bounds.width
    let calc = viewWidth / 10
      
    
    NSLayoutConstraint.activate([
      menuButton1.topAnchor.constraint(equalTo: self.topAnchor),
      menuButton1.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      menuButton1.widthAnchor.constraint(equalToConstant: calc * 3.5),
      menuButton1.heightAnchor.constraint(equalTo: self.heightAnchor),
      
      menuButton2.topAnchor.constraint(equalTo: menuButton1.topAnchor),
      menuButton2.leadingAnchor.constraint(equalTo: menuButton1.trailingAnchor),
      menuButton2.widthAnchor.constraint(equalToConstant: calc * 3),
      menuButton2.heightAnchor.constraint(equalTo: menuButton1.heightAnchor),
      
      menuButton3.topAnchor.constraint(equalTo: menuButton1.topAnchor),
      menuButton3.leadingAnchor.constraint(equalTo: menuButton2.trailingAnchor),
      menuButton3.widthAnchor.constraint(equalToConstant: calc * 3.5),
      menuButton3.heightAnchor.constraint(equalTo: menuButton1.heightAnchor),
    ])
  }

  

}
