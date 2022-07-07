//
//  Character.swift
//  HSK1
//
//  Created by mac on 06.07.2022.
//

import Foundation

class Character {
    let name: String
    var isFlipped: Bool = false
    
    init(name: String) {
        self.name = name
        //self.isFlipped = isFlipped
    }
}

extension Character {
    static func getCharacters() -> [Character] {
        let charactersName = DataManager.shared.characters
        let characters = [Character(name: charactersName[0]),
                          Character(name: charactersName[1]),
                          Character(name: charactersName[2]),
                          Character(name: charactersName[3]),
                          Character(name: charactersName[4]),
                          Character(name: charactersName[5]),
                          Character(name: charactersName[6]),
                          Character(name: charactersName[7]),
                          Character(name: charactersName[8]),
                          Character(name: charactersName[9])]
    return characters
    }
}
