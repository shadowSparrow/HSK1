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
    let examples: String
    var isFlipped: Bool = false
    
    init(name: String, pingYing: String, translation: String, examples: String) {
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
        [Character(name: charactersName["爱"]![0],
                   pingYing: charactersName["爱"]![1],
                   translation: charactersName["爱"]![2],
                   examples: charactersName["爱"]![3]),
         Character(name: charactersName["八"]![0],
                    pingYing: charactersName["八"]![1],
                    translation: charactersName["八"]![2],
                    examples: charactersName["八"]![3]),
         Character(name: charactersName["爸爸"]![0],
                    pingYing: charactersName["爸爸"]![1],
                    translation: charactersName["爸爸"]![2],
                    examples: charactersName["爸爸"]![3]),
        ]
         return characters
    }
}
