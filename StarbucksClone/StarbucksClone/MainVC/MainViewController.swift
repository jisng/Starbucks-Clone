//
//  MainViewController.swift
//  StarbucksClone
//
//  Created by Hailey Lee on 2020/03/05.
//  Copyright © 2020 Hailey. All rights reserved.
//

import UIKit
import SideMenu

class MainViewController: UIViewController {
    
    private let welcomeLabel = UILabel()
    
    private var levelButton = UIButton()
    private var cardButton = UIButton()
    private var sirenOrderButton = UIButton()
    private var giftShopButton = UIButton()
    private var eCouponButton = UIButton()
    private var whatsNewButton = UIButton()
    
    var menuController: UIViewController!
    var notificationController: UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
    
    
    private func setUI() {
        view.backgroundColor = #colorLiteral(red: 0.1137254902, green: 0.1137254902, blue: 0.1137254902, alpha: 1)
    
        // 네비게이션
        self.navigationItem.title = "STARBUCKS®"
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage.init(systemName: "line.horizontal.3"), style: .done, target: self, action: #selector(didTapMenu))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage.init(systemName: "bell"), style: .done, target: self, action: #selector(didTapNotification))
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "뒤로", style: .plain, target: self, action: nil)
        
        welcomeLabel.font = UIFont.systemFont(ofSize: 14)
        welcomeLabel.text = "안녕하세요. 스타벅스입니다."
        welcomeLabel.backgroundColor = #colorLiteral(red: 0.1294117647, green: 0.1294117647, blue: 0.1294117647, alpha: 1)
        welcomeLabel.textColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)
        welcomeLabel.textAlignment = .center
        
        levelButton = self.basicButtonStyle(title: "★ Welcome level")
        levelButton.tag = 0
        cardButton = self.basicButtonStyle(title: "Card")
        cardButton.tag = 1
        sirenOrderButton = self.basicButtonStyle(title: "Siren Order")
        sirenOrderButton.tag = 2
        giftShopButton = self.basicButtonStyle(title: "Gift Shop")
        giftShopButton.tag = 3
        eCouponButton = self.basicButtonStyle(title: "e-Coupon")
        eCouponButton.tag = 4
        whatsNewButton = self.basicButtonStyle(title: "What's New")
        whatsNewButton.tag = 5
        
        [welcomeLabel, levelButton, cardButton, sirenOrderButton, giftShopButton, eCouponButton, whatsNewButton].forEach {
        view.addSubview($0)
        }
    }
    
    
    private func setLayout() {
        
        let guide = self.view.safeAreaLayoutGuide
        
        let width: CGFloat = 0.5
        let heightLabel: CGFloat = 0.06
        let heightImage: CGFloat = 0.36
        let heightText: CGFloat = 0.22
        
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: guide.topAnchor,constant: 0),
            welcomeLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 0),
            welcomeLabel.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: 0),
            welcomeLabel.heightAnchor.constraint(equalTo: guide.heightAnchor, multiplier: heightLabel)
            //            testLabel.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: 0)
        ])
        
        levelButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            levelButton.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor,constant: 0),
            levelButton.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 0),
            levelButton.heightAnchor.constraint(equalTo: guide.heightAnchor, multiplier: heightImage),
            levelButton.widthAnchor.constraint(equalTo: guide.widthAnchor, multiplier: width)
        ])
        
        cardButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardButton.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor,constant: 0),
            cardButton.leadingAnchor.constraint(equalTo: levelButton.trailingAnchor, constant: 0),
            cardButton.heightAnchor.constraint(equalTo: guide.heightAnchor, multiplier: heightImage),
            cardButton.widthAnchor.constraint(equalTo: guide.widthAnchor, multiplier: width)
        ])
        
        sirenOrderButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sirenOrderButton.topAnchor.constraint(equalTo: levelButton.bottomAnchor,constant: 0),
            sirenOrderButton.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 0),
            sirenOrderButton.heightAnchor.constraint(equalTo: guide.heightAnchor, multiplier: heightImage),
            sirenOrderButton.widthAnchor.constraint(equalTo: guide.widthAnchor, multiplier: width)
        ])
        
        giftShopButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            giftShopButton.topAnchor.constraint(equalTo: levelButton.bottomAnchor,constant: 0),
            giftShopButton.leadingAnchor.constraint(equalTo: sirenOrderButton.trailingAnchor, constant: 0),
            giftShopButton.heightAnchor.constraint(equalTo: guide.heightAnchor, multiplier: heightImage),
            giftShopButton.widthAnchor.constraint(equalTo: guide.widthAnchor, multiplier: width)
        ])
        
        eCouponButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            eCouponButton.topAnchor.constraint(equalTo: sirenOrderButton.bottomAnchor,constant: 0),
            eCouponButton.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 0),
            eCouponButton.heightAnchor.constraint(equalTo: guide.heightAnchor, multiplier: heightText),
            eCouponButton.widthAnchor.constraint(equalTo: guide.widthAnchor, multiplier: width)
        ])
        
        whatsNewButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            whatsNewButton.topAnchor.constraint(equalTo: sirenOrderButton.bottomAnchor,constant: 0),
            whatsNewButton.leadingAnchor.constraint(equalTo: eCouponButton.trailingAnchor, constant: 0),
            whatsNewButton.heightAnchor.constraint(equalTo: guide.heightAnchor, multiplier: heightText),
            whatsNewButton.widthAnchor.constraint(equalTo: guide.widthAnchor, multiplier: width)
        ])
    }

    @objc func didTapMenu() {
        
        var sideMenuSet = SideMenuSettings()
        
        sideMenuSet.presentationStyle.backgroundColor = .black // 아무런 영향 X
        sideMenuSet.menuWidth = UIScreen.main.bounds.width * 0.7
        sideMenuSet.presentationStyle = .menuSlideIn
        sideMenuSet.presentationStyle.presentingScaleFactor = 0.84
        sideMenuSet.blurEffectStyle = .none
        
        
        let leftNavigationController = SideMenuNavigationController(rootViewController: MenuViewController(), settings: sideMenuSet)
        SideMenuManager.default.leftMenuNavigationController = leftNavigationController
        
        SideMenuManager.default.addPanGestureToPresent(toView: self.navigationController!.navigationBar)
        SideMenuManager.default.addScreenEdgePanGesturesToPresent(toView: self.navigationController!.view)
        leftNavigationController.statusBarEndAlpha = 0
        leftNavigationController.navigationBar.barTintColor = .white
        
        present(leftNavigationController, animated: true, completion: nil)
//        dismiss(animated: true, completion: nil)
    }
    
    @objc func didTapNotification() {
        var sideMenuSet = SideMenuSettings()
        sideMenuSet.presentationStyle.backgroundColor = .black
        sideMenuSet.menuWidth = UIScreen.main.bounds.width * 0.7
        sideMenuSet.presentationStyle = .menuSlideIn
        sideMenuSet.presentationStyle.presentingScaleFactor = 0.84
        
        let rightNavigationController = SideMenuNavigationController(rootViewController: NotificationViewController(), settings: sideMenuSet)
        
        SideMenuManager.default.rightMenuNavigationController = rightNavigationController
        
        rightNavigationController.navigationBar.backgroundColor = .white
        
        SideMenuManager.default.addPanGestureToPresent(toView: self.navigationController!.navigationBar)
        SideMenuManager.default.addScreenEdgePanGesturesToPresent(toView: self.navigationController!.view)
        rightNavigationController.statusBarEndAlpha = 0
    
        self.present(rightNavigationController, animated: true, completion: nil)
    }
    
    @objc func didTapButton(_ sender: UIButton) {
        UIView.animate(withDuration: 0.2) {
            sender.alpha = 0.4
            sender.backgroundColor = .black
            sender.alpha = 1
            sender.backgroundColor = #colorLiteral(red: 0.1137254902, green: 0.1137254902, blue: 0.1137254902, alpha: 1)
        }
        
        switch sender.tag {
        case 0: // levelButton
            navigationController?.pushViewController(LevelViewController(), animated: true)
//        case 1: // cardButton
        case 2: // sirenOrderButton
            navigationController?.pushViewController(SirenOrderViewController(), animated: true)
        case 3: // giftShopButton
            navigationController?.pushViewController(GiftShopController(), animated: true)
//        case 4: // eCouponButton
//        case 5: // whatsNewButton
        default:
            break
        }
        
    }
    private func basicButtonStyle(title: String) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.1137254902, green: 0.1137254902, blue: 0.1137254902, alpha: 1)
        button.tintColor = .white
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        return button
    }
    
    
}
    
    


extension MainViewController: SideMenuNavigationControllerDelegate {

    func sideMenuWillAppear(menu: SideMenuNavigationController, animated: Bool) {
        print("SideMenu Appearing! (animated: \(animated))")
    }

    func sideMenuDidAppear(menu: SideMenuNavigationController, animated: Bool) {
        print("SideMenu Appeared! (animated: \(animated))")
    }

    func sideMenuWillDisappear(menu: SideMenuNavigationController, animated: Bool) {
        print("SideMenu Disappearing! (animated: \(animated))")
    }

    func sideMenuDidDisappear(menu: SideMenuNavigationController, animated: Bool) {
        print("SideMenu Disappeared! (animated: \(animated))")
    }
}

