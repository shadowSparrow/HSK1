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
    
    static func getCharacters(charactersData:[CharacterData]) -> [Character] {
        var characters:[Character] = []
        for character in charactersData {
        let currentCharacter = Character(name: character.character, imageName: character.imageName, pingYing: character.pingYing, translation: character.translation)
            characters.append(currentCharacter)
        }
        return characters
             }
    
    static func getCharacters() -> [Character] {
        let charactersName = DataManager.shared.characters
        var characters:[Character] = []
        for character in charactersName {
        let currentCharacter = Character(name: character.character, imageName: character.imageName, pingYing: character.pingYing, translation: character.translation)
            characters.append(currentCharacter)
        }
        return characters
             }
    
    static func getFamilyCharacters() -> [Character] {
        let charactersName = DataManager.shared.familyCharacters
        var characters:[Character] = []
        for character in charactersName {
        let currentCharacter = Character(name: character.character, imageName: character.imageName, pingYing: character.pingYing, translation: character.translation)
            characters.append(currentCharacter)
        }
        return characters
             }
    
    static func getTravelCharacters() -> [Character] {
        let charactersName = DataManager.shared.travelCharacters
        var characters:[Character] = []
        for character in charactersName {
        let currentCharacter = Character(name: character.character, imageName: character.imageName, pingYing: character.pingYing, translation: character.translation)
            characters.append(currentCharacter)
        }
        return characters
             }
    
    static func getEducationCharacters() -> [Character] {
        let charactersName = DataManager.shared.educationCharacters
        var characters:[Character] = []
        for character in charactersName {
        let currentCharacter = Character(name: character.character, imageName: character.imageName, pingYing: character.pingYing, translation: character.translation)
            characters.append(currentCharacter)
        }
        return characters
        //static
}
}
