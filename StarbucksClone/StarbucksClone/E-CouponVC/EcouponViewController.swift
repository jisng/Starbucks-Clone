//
//  EcouponViewController.swift
//  StarbuckCloneEx2
//
//  Created by Mac mini on 2020/03/04.
//  Copyright © 2020 Mac mini. All rights reserved.
//

import UIKit

class EcouponViewController: UIViewController {
  
  let menuImage = UIImageView()
  let nameLabel = UILabel()
  let EnNameLabel = UILabel()
  let giftImg = UIButton()
  let bookMarkButton = UIButton()
  let priceLabel = UILabel()
  let minusButton = UIButton()
  let quantityLabel = UILabel()
  let plusButton = UIButton()
  let hotButton = UIButton()
  let icedButton = UIButton()
  
  // setUI2()
  let decafMsgLabel = UILabel()
  let chooseCupLabel = UILabel()
  let cupMsgLabel = UILabel()
  
  let buttonView = ChooseCupButtonView()
  let lineView1 = ChooseCupButtonLineView()
  let lineView2 = ChooseCupButtonLineView()
  let mugCupButton = UIButton()
  let personalCupButton = UIButton()
  let plasticCupButton = UIButton()
  
  let sizeButtonView = ChooseSizeButtonCustomView()
  let sizeButton = UIButton(type: .custom) // customButton
  
  let personalOptionButtonView = ChoosePersonalOptionCustomView()
  let personalOptionButton = UIButton() // customButton, 데이터는 어떻게 처리?
  
  let presentButton = UIButton()
  let orderButton = UIButton()
  let addBasketButton = UIButton()

    override func viewDidLoad() {
      super.viewDidLoad()
      
      setNavigationBar()
      setUI()
      setAutoLayout()
      setUI2()
      setAutoLayout2()
    }
    
    func setNavigationBar() {
      view.backgroundColor = .white
      title = "e-Coupon"

      navigationController?.navigationBar.barStyle = .black
      navigationController?.navigationBar.tintColor = .white
      navigationController?.navigationBar.backgroundColor = .black
      
      //    let registerBarButton: UIButton = {
      //      let registerBarButton = UIButton()
      //      registerBarButton.setImage(UIImage(systemName: "plus"), for: .normal)
      //      registerBarButton.imageView?.contentMode = .scaleToFill
      //      registerBarButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
      //      registerBarButton.addTarget(self, action: #selector(didTapRegisterBarButton(_:)), for: .touchUpInside)
      //      return registerBarButton
      //    }()
      let registerBarButton = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .done, target: self, action: #selector(didTapRegisterBarButton(_:)))
      
      let informationBarButton: UIButton = {
        let informationBarButton = UIButton()
        informationBarButton.setImage(UIImage(systemName: "info.circle"), for: .normal)
        informationBarButton.imageView?.contentMode = .scaleToFill
        informationBarButton.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        informationBarButton.addTarget(self, action: #selector(didTapInformationBarButton(_:)), for: .touchUpInside)
        return informationBarButton
      }()
      
      navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: informationBarButton), registerBarButton]
      
     
      //navigationbar.items = [navigationItem]
      
      
      
      //    let registerBarButton = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .done, target: self, action: #selector(didTapRegisterBarButton(_:)))
      //    let informationBarButton = UIBarButtonItem(image: UIImage(systemName: "info.circle"), style: .done, target: self, action:  #selector(didTapInformationBarButton(_:)))
      //    navigationItem.rightBarButtonItems = [informationBarButton, registerBarButton]
    }
    
    @objc private func didTapRegisterBarButton(_ sender: Any) {
      
    }
    
    @objc private func didTapInformationBarButton(_ sender: Any) {
      
    }
  
  func setUI() {
    [menuImage, nameLabel, giftImg, EnNameLabel, priceLabel, bookMarkButton, minusButton, quantityLabel, plusButton, hotButton, icedButton, decafMsgLabel].forEach {
      view.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    menuImage.image = UIImage(named: "coffee")
    menuImage.layer.cornerRadius = 50
    menuImage.contentMode = .scaleAspectFit
    menuImage.clipsToBounds = true
    
    nameLabel.text = "카페 아메리카노"
    nameLabel.textColor = .black
    nameLabel.font = UIFont.systemFont(ofSize: 14)
    
    let edge:CGFloat = 3
    giftImg.setImage(UIImage(systemName: "gift"), for: .normal)
    giftImg.tintColor = .white
    giftImg.backgroundColor = .darkGray
    giftImg.imageView?.contentMode = .scaleAspectFit
    giftImg.imageView?.clipsToBounds = true
    giftImg.imageEdgeInsets = UIEdgeInsets(top: edge, left: edge, bottom: edge, right: edge)
    giftImg.layer.cornerRadius = 8
    
    bookMarkButton.setImage(UIImage(systemName: "bookmark"), for: .normal)
    bookMarkButton.tintColor = .black
    bookMarkButton.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    //    bookMarkButton.contentVerticalAlignment = .fill
    //    bookMarkButton.contentHorizontalAlignment = .fill
    let edge2:CGFloat = 8
    bookMarkButton.imageView?.contentMode = .scaleAspectFit
    bookMarkButton.imageView?.clipsToBounds = true
    bookMarkButton.imageEdgeInsets = UIEdgeInsets(top: edge2, left: edge2, bottom: edge2, right: edge2)
    bookMarkButton.layer.cornerRadius = 15
    
    EnNameLabel.text = "Cafe Americano"
    EnNameLabel.textColor = #colorLiteral(red: 0.5738074183, green: 0.5655357838, blue: 0, alpha: 1)
    EnNameLabel.font = UIFont.systemFont(ofSize: 11)
    
    priceLabel.text = "4,100원"
    priceLabel.textColor = .black
    priceLabel.font = UIFont.boldSystemFont(ofSize: 20)
    
    minusButton.setImage(UIImage(systemName: "minus"), for: .normal)
    minusButton.tintColor = .darkGray
    minusButton.backgroundColor = .lightGray
    minusButton.layer.cornerRadius = 2
    
    quantityLabel.text = "1"
    quantityLabel.textColor = .black
    quantityLabel.font = UIFont.boldSystemFont(ofSize: 20)
    
    plusButton.setImage(UIImage(systemName: "plus"), for: .normal)
    plusButton.tintColor = .darkGray
    plusButton.backgroundColor = .lightGray
    plusButton.layer.cornerRadius = 2
    
    hotButton.setTitle("HOT", for: .normal)
    hotButton.setTitleColor(.white, for: .normal)
    hotButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
    hotButton.backgroundColor = #colorLiteral(red: 0.6451261104, green: 0.1319800223, blue: 0.06538274611, alpha: 1)
    hotButton.layer.borderColor = #colorLiteral(red: 0.6451261104, green: 0.1319800223, blue: 0.06538274611, alpha: 1)
    hotButton.layer.borderWidth = 1
    hotButton.layer.cornerRadius = 2
    
    icedButton.setTitle("ICED", for: .normal)
    icedButton.setTitleColor(.white, for: .normal)
    icedButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
    icedButton.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
    icedButton.layer.borderColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
    icedButton.layer.borderWidth = 1
    icedButton.layer.cornerRadius = 2
  }
  
  func setUI2() {
    [decafMsgLabel, chooseCupLabel, cupMsgLabel, buttonView, mugCupButton, personalCupButton, plasticCupButton, sizeButtonView, personalOptionButtonView, presentButton, orderButton, addBasketButton].forEach {
      view.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    decafMsgLabel.text = "디카페인 커피 Tab에서 \n 디카페인, 1/2디카페인 카페 아메리카노를 주문할 수 있습니다."
    decafMsgLabel.textColor = .darkGray
    decafMsgLabel.font = UIFont.systemFont(ofSize: 13)
    decafMsgLabel.numberOfLines = 0
    decafMsgLabel.textAlignment = .center
    
    chooseCupLabel.text = "컵 선택"
    chooseCupLabel.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    chooseCupLabel.font = UIFont.systemFont(ofSize: 13)
    
    cupMsgLabel.text = "   환경보호를 위해 매장 내에서는 머그컵을 사용해주세요.  "
    cupMsgLabel.textColor = .white
    cupMsgLabel.font = UIFont.systemFont(ofSize: 12)
    cupMsgLabel.backgroundColor = #colorLiteral(red: 0.03676272521, green: 0.5975982898, blue: 0.5679046872, alpha: 1)
    cupMsgLabel.layer.borderColor = #colorLiteral(red: 0.03676272521, green: 0.5975982898, blue: 0.5679046872, alpha: 1)
    cupMsgLabel.layer.borderWidth = 1
    cupMsgLabel.layer.cornerRadius = 10
    cupMsgLabel.clipsToBounds = true
    
    lineView1.translatesAutoresizingMaskIntoConstraints = false
    lineView2.translatesAutoresizingMaskIntoConstraints = false
    buttonView.addSubview(lineView1)
    buttonView.addSubview(lineView2)
    mugCupButton.setTitle("매장컵", for: .normal)
    mugCupButton.setTitleColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), for: .normal)
    mugCupButton.titleLabel?.font = UIFont.systemFont(ofSize: 12)
    mugCupButton.addTarget(self, action: #selector(didTapStoreCup(_:)), for: .touchUpInside)
    buttonView.addSubview(mugCupButton)
    
    personalCupButton.setTitle("개인컵", for: .normal)
    personalCupButton.setTitleColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), for: .normal)
    personalCupButton.titleLabel?.font = UIFont.systemFont(ofSize: 12)
    buttonView.addSubview(personalCupButton)
    
    plasticCupButton.setTitle("일회용컵", for: .normal)
    plasticCupButton.setTitleColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), for: .normal)
    plasticCupButton.titleLabel?.font = UIFont.systemFont(ofSize: 12)
    plasticCupButton.addTarget(self, action: #selector(didTapPlasticCup(_:)), for: .touchUpInside)
    buttonView.addSubview(plasticCupButton)
    
    sizeButton.translatesAutoresizingMaskIntoConstraints = false
    sizeButtonView.addSubview(sizeButton)
    sizeButton.backgroundColor = .clear
    sizeButton.addTarget(self, action: #selector(didTapSizeButton(_:)), for: .touchUpInside)
    
    personalOptionButton.translatesAutoresizingMaskIntoConstraints = false
    personalOptionButtonView.addSubview(personalOptionButton)
    personalCupButton.backgroundColor = .clear
    
    // present, order, addBasket
    presentButton.setTitle("선물하기", for: .normal)
    presentButton.setTitleColor(.white, for: .normal)
    presentButton.backgroundColor = #colorLiteral(red: 0.6644858718, green: 0.484285295, blue: 0.4908220172, alpha: 1)
    presentButton.titleLabel?.font = UIFont.systemFont(ofSize: 13)
    presentButton.layer.cornerRadius = 2
    
    orderButton.setTitle("바로 주문하기", for: .normal)
    orderButton.setTitleColor(.white, for: .normal)
    orderButton.backgroundColor = #colorLiteral(red: 0.6644858718, green: 0.484285295, blue: 0.4908220172, alpha: 1)
    orderButton.titleLabel?.font = UIFont.systemFont(ofSize: 13)
    orderButton.layer.cornerRadius = 2
    
    addBasketButton.setTitle("장바구니 담기", for: .normal)
    addBasketButton.setTitleColor(.darkGray, for: .normal)
    addBasketButton.backgroundColor = .lightGray
    addBasketButton.titleLabel?.font = UIFont.systemFont(ofSize: 13)
    addBasketButton.layer.cornerRadius = 2
  }
  
  @objc func didTapSizeButton(_ sender: Any) {
    sizeButtonView.sizeLabel.text = "Grande"
    print("클릭!")
  }
  
  @objc func didTapPlasticCup(_ sender: Any) {
    plasticCupButton.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    plasticCupButton.setTitleColor(.white, for: .normal)
    cupMsgLabel.text = "  ✓컵 선택이 완료되었습니다.  "
    [personalCupButton, mugCupButton].forEach {
      $0.setTitleColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), for: .normal)
      $0.backgroundColor = .clear
    }
    
    
  }
  
  @objc func didTapStoreCup(_ sender: Any) {
    mugCupButton.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    mugCupButton.setTitleColor(.white, for: .normal)
    cupMsgLabel.text = "  ☘️환경보호에 동참해주셔서 감사합니다.  "
    [personalCupButton, plasticCupButton].forEach {
      $0.setTitleColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), for: .normal)
      $0.backgroundColor = .clear
    }
  }
  
  func setAutoLayout2() {
    let guide = view.safeAreaLayoutGuide
    let margin: CGFloat = 10
    let viewWidth: CGFloat = guide.layoutFrame.width-(margin*2)
    print("viewWidth:", viewWidth/3)
    
    NSLayoutConstraint.activate([
      decafMsgLabel.topAnchor.constraint(equalTo: hotButton.bottomAnchor, constant: margin*2),
      decafMsgLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: margin),
      decafMsgLabel.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -margin),
      
      chooseCupLabel.topAnchor.constraint(equalTo: decafMsgLabel.bottomAnchor,constant: margin*3),
      chooseCupLabel.leadingAnchor.constraint(equalTo: decafMsgLabel.leadingAnchor),
      
      cupMsgLabel.topAnchor.constraint(equalTo: decafMsgLabel.bottomAnchor, constant: margin*2.5),
      cupMsgLabel.trailingAnchor.constraint(equalTo: decafMsgLabel.trailingAnchor),
      cupMsgLabel.heightAnchor.constraint(equalToConstant: 20),
      
      buttonView.leadingAnchor.constraint(equalTo: chooseCupLabel.leadingAnchor),
      buttonView.topAnchor.constraint(equalTo: chooseCupLabel.bottomAnchor, constant: margin),
      buttonView.widthAnchor.constraint(equalToConstant: viewWidth),
      buttonView.heightAnchor.constraint(equalToConstant: 40),
      
      lineView1.topAnchor.constraint(equalTo: buttonView.topAnchor),
      lineView1.leadingAnchor.constraint(equalTo: buttonView.leadingAnchor, constant: viewWidth/3),
      lineView1.widthAnchor.constraint(equalToConstant: 1),
      lineView1.heightAnchor.constraint(equalTo: buttonView.heightAnchor),
      
      lineView2.topAnchor.constraint(equalTo: buttonView.topAnchor),
      lineView2.trailingAnchor.constraint(equalTo: buttonView.trailingAnchor, constant: -viewWidth/3),
      lineView2.widthAnchor.constraint(equalToConstant: 1),
      lineView2.heightAnchor.constraint(equalTo: buttonView.heightAnchor),
      
      mugCupButton.leadingAnchor.constraint(equalTo: buttonView.leadingAnchor),
      mugCupButton.topAnchor.constraint(equalTo: buttonView.topAnchor),
      mugCupButton.widthAnchor.constraint(equalToConstant: viewWidth/3),
      mugCupButton.heightAnchor.constraint(equalTo: buttonView.heightAnchor),
      
      personalCupButton.leadingAnchor.constraint(equalTo: mugCupButton.trailingAnchor),
      personalCupButton.topAnchor.constraint(equalTo: mugCupButton.topAnchor),
      personalCupButton.widthAnchor.constraint(equalToConstant: viewWidth/3),
      personalCupButton.heightAnchor.constraint(equalTo: buttonView.heightAnchor),
      
      plasticCupButton.trailingAnchor.constraint(equalTo: buttonView.trailingAnchor),
      plasticCupButton.topAnchor.constraint(equalTo: mugCupButton.topAnchor),
      plasticCupButton.widthAnchor.constraint(equalToConstant: viewWidth/3),
      plasticCupButton.heightAnchor.constraint(equalTo: buttonView.heightAnchor),
      
      sizeButtonView.topAnchor.constraint(equalTo: buttonView.bottomAnchor, constant: margin),
      sizeButtonView.leadingAnchor.constraint(equalTo: buttonView.leadingAnchor),
      sizeButtonView.trailingAnchor.constraint(equalTo: buttonView.trailingAnchor),
      sizeButtonView.heightAnchor.constraint(equalToConstant: 40),
      
      sizeButton.topAnchor.constraint(equalTo: sizeButtonView.topAnchor),
      sizeButton.leadingAnchor.constraint(equalTo: sizeButtonView.leadingAnchor),
      sizeButton.trailingAnchor.constraint(equalTo: sizeButtonView.trailingAnchor),
      sizeButton.bottomAnchor.constraint(equalTo: sizeButtonView.bottomAnchor),
      
      personalOptionButtonView.topAnchor.constraint(equalTo: sizeButtonView.bottomAnchor, constant: margin),
      personalOptionButtonView.leadingAnchor.constraint(equalTo: sizeButtonView.leadingAnchor),
      personalOptionButtonView.trailingAnchor.constraint(equalTo: sizeButtonView.trailingAnchor),
      personalOptionButtonView.heightAnchor.constraint(equalToConstant: 40),
      
      personalOptionButton.topAnchor.constraint(equalTo: personalOptionButtonView.topAnchor),
      personalOptionButton.leadingAnchor.constraint(equalTo: personalOptionButtonView.leadingAnchor),
      personalOptionButton.trailingAnchor.constraint(equalTo: personalOptionButtonView.trailingAnchor),
      personalOptionButton.bottomAnchor.constraint(equalTo: personalOptionButtonView.bottomAnchor),
      
      presentButton.topAnchor.constraint(equalTo: personalOptionButtonView.bottomAnchor, constant: margin),
      presentButton.leadingAnchor.constraint(equalTo: personalOptionButtonView.leadingAnchor),
      presentButton.widthAnchor.constraint(equalToConstant: ((viewWidth-(margin/2))/2)),
      presentButton.heightAnchor.constraint(equalToConstant: 40),
      
      orderButton.topAnchor.constraint(equalTo: personalOptionButtonView.bottomAnchor, constant: margin),
      orderButton.trailingAnchor.constraint(equalTo: personalOptionButtonView.trailingAnchor),
      orderButton.widthAnchor.constraint(equalToConstant: ((viewWidth-(margin/2))/2)),
      orderButton.heightAnchor.constraint(equalToConstant: 40),
      
      addBasketButton.topAnchor.constraint(equalTo: orderButton.bottomAnchor, constant: margin/2),
      addBasketButton.leadingAnchor.constraint(equalTo: presentButton.leadingAnchor),
      addBasketButton.trailingAnchor.constraint(equalTo: orderButton.trailingAnchor),
      addBasketButton.heightAnchor.constraint(equalToConstant: 40),
                                           
    ])
    
  }
  
  
  
  func setAutoLayout() {
    
    let guide = view.safeAreaLayoutGuide
    let margin: CGFloat = 10
    let temperButtonSize:CGFloat = (view.frame.width-(margin*2.5))/2
    NSLayoutConstraint.activate([
      menuImage.topAnchor.constraint(equalTo: guide.topAnchor, constant: margin),
      menuImage.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: margin),
      menuImage.widthAnchor.constraint(equalToConstant: 100),
      menuImage.heightAnchor.constraint(equalToConstant: 100),
      
      nameLabel.topAnchor.constraint(equalTo: menuImage.topAnchor),
      nameLabel.leadingAnchor.constraint(equalTo: menuImage.trailingAnchor, constant: margin*1.5),
      
      giftImg.topAnchor.constraint(equalTo: nameLabel.topAnchor),
      giftImg.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 3),
      giftImg.widthAnchor.constraint(equalToConstant: 17),
      giftImg.heightAnchor.constraint(equalToConstant: 17),
      
      bookMarkButton.topAnchor.constraint(equalTo: giftImg.topAnchor),
      bookMarkButton.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -margin),
      bookMarkButton.widthAnchor.constraint(equalToConstant: 30),
      bookMarkButton.heightAnchor.constraint(equalToConstant: 30),
      
      EnNameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 3),
      EnNameLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
      
      priceLabel.topAnchor.constraint(equalTo: EnNameLabel.bottomAnchor, constant: margin),
      priceLabel.leadingAnchor.constraint(equalTo: EnNameLabel.leadingAnchor),
      
      minusButton.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: margin),
      minusButton.leadingAnchor.constraint(equalTo: priceLabel.leadingAnchor),
      minusButton.widthAnchor.constraint(equalToConstant: 30),
      minusButton.heightAnchor.constraint(equalToConstant: 30),
      
      quantityLabel.topAnchor.constraint(equalTo: minusButton.topAnchor),
      quantityLabel.leadingAnchor.constraint(equalTo: minusButton.trailingAnchor, constant: margin*3),
      
      plusButton.topAnchor.constraint(equalTo: minusButton.topAnchor),
      plusButton.leadingAnchor.constraint(equalTo: quantityLabel.trailingAnchor, constant: margin*3),
      plusButton.widthAnchor.constraint(equalToConstant: 30),
      plusButton.heightAnchor.constraint(equalToConstant: 30),
      
      hotButton.topAnchor.constraint(equalTo: plusButton.bottomAnchor, constant: margin*3),
      hotButton.leadingAnchor.constraint(equalTo: menuImage.leadingAnchor),
      hotButton.widthAnchor.constraint(equalToConstant: temperButtonSize),
      hotButton.heightAnchor.constraint(equalToConstant: temperButtonSize/4),
      
      icedButton.topAnchor.constraint(equalTo: plusButton.bottomAnchor, constant: margin*3),
      icedButton.leadingAnchor.constraint(equalTo: hotButton.trailingAnchor, constant: margin/2),
      icedButton.widthAnchor.constraint(equalToConstant: temperButtonSize),
      icedButton.heightAnchor.constraint(equalToConstant: temperButtonSize/4),
    ])
  }
    

}
