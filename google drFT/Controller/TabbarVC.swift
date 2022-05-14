//
//  TabbarVC.swift
//  google drFT
//
//  Created by Azizbek Salimov on 13.05.2022.
//

import UIKit

class TabbarVC: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabbarItemsSetup()
    }
    
    
    func tabbarItemsSetup(){
        let vc1 = HomePage()
        let navVc = UINavigationController(rootViewController: vc1)
        
        let barBackgroundColor: UIColor = UIColor(named: "googleColor")!
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithDefaultBackground()
        appearance.backgroundColor = barBackgroundColor
        appearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        
        let item1 = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), selectedImage: nil)
        
        
        
        let vc2 = SavedVC()
        let item2 = UITabBarItem(title: "Saved", image: UIImage(systemName: "star.fill"), selectedImage: nil)
        
        let vc3 = SettingsVC()
        let item3 = UITabBarItem(title: "Settings", image: UIImage(systemName: "gearshape.fill"), selectedImage: nil)
        navVc.tabBarItem = item1
        vc2.tabBarItem = item2
        vc3.tabBarItem = item3
        
        tabBarItem.standardAppearance?.stackedItemSpacing = .greatestFiniteMagnitude
        
        
        viewControllers = [navVc, vc2, vc3]
        
    }
    
    
    
    
    
}




