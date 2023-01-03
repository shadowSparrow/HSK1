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
    var examples: [Example]
    init(character: String, imageName: String, pingYing: String, translation: String, examples: [Example]) {
        self.character = character
        self.imageName = imageName
        self.pingYing = pingYing
        self.translation = translation
        self.examples = examples
 }
}
struct Example {
    var chinese: String
    var pingYing: String
    var translation: String
}
