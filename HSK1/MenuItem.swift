//
//  MenuItem.swift
//  HSK1
//
//  Created by mac on 28.06.2022.
//

import Foundation

struct MenuItem {
    let imageName: String
    let labelText: String
}

extension MenuItem {
    static func getItems() -> [MenuItem]  {
        let imageNames = DataManager.shared.imageNames
        let labelNames = DataManager.shared.labelNames
        let menuItems = [MenuItem(imageName: imageNames[0], labelText: labelNames[0]),MenuItem(imageName: imageNames[1], labelText: labelNames[1]), MenuItem(imageName: imageNames[2], labelText: labelNames[2])]
        return menuItems
    }
}

