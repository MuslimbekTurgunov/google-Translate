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

            let barBackgroundColor = #colorLiteral(red: 0.291172266, green: 0.5433652401, blue: 0.9586004615, alpha: 1)

            let appearance = UINavigationBarAppearance()
            appearance.configureWithDefaultBackground()
            appearance.backgroundColor = barBackgroundColor
            appearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]

            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
            
            let item1 = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), selectedImage: nil)
            
            
            
            let vc2 = SavedVC()
            let item2 = UITabBarItem(title: "Saved", image: UIImage(systemName: "square.grid.2x2"), selectedImage: nil)
            
            let vc3 = SettingsVC()
            let item3 = UITabBarItem(title: "settings", image: UIImage(systemName: "square.grid.2x2"), selectedImage: nil)
            navVc.tabBarItem = item1
            vc2.tabBarItem = item2
            vc3.tabBarItem = item3
            
            //        tabBarController?.tabBar.itemWidth = 30
            //        tabBarController?.tabBar.itemSpacing = 300
            tabBarItem.standardAppearance?.stackedItemSpacing = .greatestFiniteMagnitude
            
            //tabBarController?.tabBar.itemPositioning = 60
            
            viewControllers = [navVc, vc2, vc3]
            
        }
        
        
        
    

}




