//
//  AppDelegate.swift
//  google drFT
//
//  Created by Azizbek Salimov on 12.05.2022.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        let vc = TabbarVC()
        
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        
        return true
    }
   

}
