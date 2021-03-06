//
//  Character.swift
//  HSK1
//
//  Created by mac on 06.07.2022.
//

import Foundation

class Character {
    let name: String
    let pingYing: String
    let translation: String
    let examples: [Example]
    var isFlipped: Bool = false
    
    init(name: String, pingYing: String, translation: String, examples: [Example]) {
        self.name = name
        self.pingYing = pingYing
        self.translation = translation
        self.examples = examples
    }
}

extension Character {
    static func getCharacters() -> [Character] {
        let charactersName = DataManager.shared.characters
        let characters =
        [Character(name: charactersName[0].character,
                   pingYing: charactersName[0].pingYing,
                   translation: charactersName[0].translation,
                   examples: charactersName[0].examples),
         Character(name: charactersName[1].character,
                   pingYing: charactersName[1].pingYing,
                   translation: charactersName[1].translation,
                   examples: charactersName[1].examples),
         Character(name: charactersName[2].character,
                   pingYing: charactersName[2].pingYing,
                   translation: charactersName[2].translation,
                   examples: charactersName[2].examples),
         Character(name: charactersName[2].character,
                   pingYing: charactersName[2].pingYing,
                   translation: charactersName[2].translation,
                   examples: charactersName[2].examples),
         Character(name: charactersName[2].character,
                   pingYing: charactersName[2].pingYing,
                   translation: charactersName[2].translation,
                   examples: charactersName[2].examples),
         Character(name: charactersName[2].character,
                   pingYing: charactersName[2].pingYing,
                   translation: charactersName[2].translation,
                   examples: charactersName[2].examples),
         
        ]
         return characters
    }
}
