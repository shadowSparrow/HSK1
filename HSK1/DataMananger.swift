//
//  DataMananger.swift
//  HSK1
//
//  Created by mac on 29.06.2022.
//

import Foundation

class DataManager {
    static let shared = DataManager()
    var imageNames = ["graduationcap","brain", "gamecontroller"]
    var labelNames = ["learn", "train", "play"]
    var charactersNames = ["学习","练习","游戏"]
    
    var characters = [
        CharacterData(character: "家", imageName: "family", pingYing: "jiā", translation: "дом, семья" ),
        CharacterData(character: "医院", imageName: "hospital", pingYing: "yīyuàn", translation: "больница, госпиталь"),
        CharacterData(character: "商店", imageName: "shop", pingYing: "shāngdiàn", translation: "магазин, лавка"),
        CharacterData(character: "爱", imageName: "love", pingYing: "ài", translation: "Любить, любовь")
    ]
    private init(){}
}

