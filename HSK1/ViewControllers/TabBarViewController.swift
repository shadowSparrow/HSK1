//
//  TabBarViewController.swift
//  HSK1
//
//  Created by mac on 02.08.2023.
//

import UIKit

class TabBarViewController: UITabBarController {

    let menuItem = UITabBarItem(title: "Learn", image: UIImage(named: "brain"), tag: 1)
    let profileItem = UITabBarItem(title: "Profile", image: UIImage(named: "Persons"), tag: 2)
    let settingsItem = UITabBarItem(title: "Settings", image: UIImage(named: "Particles"), tag: 3)
    
    override func viewDidLoad() {
        super.viewDidLoad()
       setItems()
        
    }
    
    private func setItems() {
    let items = [menuItem, profileItem, settingsItem]
        self.tabBar.setItems(items, animated: true)
    }
    
}
