//
//  KeyBoardAppDelegate.swift
//  KeyArtBoardApp
//
//  Created by Eric on 9/27/14.
//  Copyright (c) 2014 Noah Goetz. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    func application(application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
            let tabBarController = UITabBarController()
            let myVC1 = TypeVC(nibName: "Keyboard", bundle: nil)
            let myVC2 = KeyboardViewController(nibName: "Drawing", bundle: nil)
            let controllers = [myVC2,myVC1]
            tabBarController.viewControllers = controllers
            window?.rootViewController = tabBarController
            //let firstImage = UIImage(named: "pie bar icon")
            //let secondImage = UIImage(named: "pizza bar icon")
            //myVC1.tabBarItem = UITabBarItem(title: "Pie", image: firstImage, tag: 1)
            //myVC2.tabBarItem = UITabBarItem(title: "Pizza", image: secondImage, tag:2)
            
            return true
    }
}
