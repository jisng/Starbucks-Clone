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
        window?.makeKeyAndVisible()
        
//        // Define the menus
//        let leftMenuNavigationController = SideMenuNavigationController(rootViewController: MainViewController())
//        SideMenuManager.default.leftMenuNavigationController = leftMenuNavigationController
//
//        let rightMenuNavigationController = SideMenuNavigationController(rootViewController: MainViewController())
//        SideMenuManager.default.rightMenuNavigationController = rightMenuNavigationController
//
//        // Setup gestures: the left and/or right menus must be set up (above) for these to work.
//        // Note that these continue to work on the Navigation Controller independent of the view controller it displays!
//        SideMenuManager.default.addPanGestureToPresent(toView: self.navigationController!.navigationBar)
//        SideMenuManager.default.addScreenEdgePanGesturesToPresent(toView: self.navigationController!.view)
//
//        // (Optional) Prevent status bar area from turning black when menu appears:
//        leftMenuNavigationController.statusBarEndAlpha = 0
//        // Copy all settings to the other menu
//        rightMenuNavigationController.settings = leftMenuNavigationController.settings
//        
        return true
    }


}


