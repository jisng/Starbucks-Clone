//
//  AppDelegate.swift
//  StarbucksClone
//
//  Created by Hailey Lee on 2020/03/02.
//  Copyright © 2020 Hailey. All rights reserved.
//

import UIKit
import SideMenu

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let mainVC = UINavigationController(rootViewController: MainViewController())
        
        mainVC.navigationBar.barStyle = .black
        mainVC.navigationBar.backgroundColor = .black
        mainVC.navigationBar.tintColor = .white
        mainVC.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.white,
            
        ]
        
        window?.rootViewController = mainVC
        window?.backgroundColor = .systemBackground
        window?.makeKeyAndVisible()
        
        return true
    }

}


