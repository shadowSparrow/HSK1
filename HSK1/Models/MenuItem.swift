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
    let imageCharacter: String
}
extension MenuItem {
    static func getItems() -> [MenuItem]  {
        let imageNames = DataManager.shared.imageNames
        let labelNames = DataManager.shared.labelNames
        let imageCharacters = DataManager.shared.charactersNames
        
        let menuItems:[MenuItem] = [
        MenuItem(imageName: imageNames[0], labelText: labelNames[0], imageCharacter: imageCharacters[0]),
        MenuItem(imageName: imageNames[1], labelText:labelNames[1], imageCharacter: imageCharacters[1]),
        MenuItem(imageName: imageNames[2], labelText: labelNames[2], imageCharacter: imageCharacters[2])
        ]
        return menuItems
    }
}

