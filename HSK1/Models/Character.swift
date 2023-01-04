//
//  Character.swift
//  HSK1
//
//  Created by mac on 06.07.2022.
//

import Foundation

class Character {
    let name: String
    let imageName: String
    let pingYing: String
    let translation: String
    var isFlipped: Bool = false
    
    init(name: String, imageName: String, pingYing: String, translation: String) {
        self.name = name
        self.imageName = imageName
        self.pingYing = pingYing
        self.translation = translation
        
    }
}
extension Character {
    static func getCharacters() -> [Character] {
        let charactersName = DataManager.shared.characters
        let characters =
        [Character(name: charactersName[0].character,
                   imageName: charactersName[0].imageName,
                   pingYing: charactersName[0].pingYing,
                   translation:charactersName[0].translation),
         Character(name: charactersName[1].character,
                   imageName: charactersName[1].imageName,
                   pingYing: charactersName[1].pingYing,
                   translation: charactersName[1].translation),
         Character(name: charactersName[2].character,
                   imageName: charactersName[2].imageName,
                   pingYing: charactersName[2].pingYing,
                   translation: charactersName[2].translation),
         Character(name: charactersName[3].character,
                   imageName: charactersName[3].imageName,
                   pingYing: charactersName[3].pingYing,
                   translation: charactersName[3].translation)
        ]
         return characters
    }
}
