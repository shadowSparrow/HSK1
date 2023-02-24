//
//  CharacterData.swift
//  HSK1
//
//  Created by mac on 21.07.2022.
//

import Foundation
class CharacterData {
    var character: String
    var imageName: String
    var pingYing: String
    var translation: String
    
    init(character: String, imageName: String, pingYing: String, translation: String) {
        self.character = character
        self.imageName = imageName
        self.pingYing = pingYing
        self.translation = translation
 }
}

