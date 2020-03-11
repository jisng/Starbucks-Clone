//
//  AppDelegate.swift
//  StarbucksClone
//
//  Created by Hailey Lee on 2020/03/02.
//  Copyright © 2020 Hailey. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = GiftThemeDetailViewController()
        window?.backgroundColor = .systemBackground
        window?.makeKeyAndVisible()
        
        return true
    }

}


