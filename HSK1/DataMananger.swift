//
//  DataMananger.swift
//  HSK1
//
//  Created by mac on 29.06.2022.
//

import Foundation

class DataManager {
    static let shared = DataManager()
    var imageNames = ["learnItem","trainItem", "playItem"]
    var labelNames = ["学习", "练习", "游戏"]
    
    var characters = [
        CharacterData(character: "家", imageName: "family", pingYing: "jiā", translation: "дом, семья", examples: [
            Example(chinese: "你家在哪儿？", pingYing: " nǐ jiā zài nǎr？", translation: "Где твой дом?"),
            Example(chinese: "我家有四口人", pingYing: " jiā yǒu sì kǒu rén", translation: " В моей семье 4 человека")
        ]),
        CharacterData(character: "医院", imageName: "hospital", pingYing: "yīyuàn", translation: "больница, госпиталь", examples: [
         
             Example(chinese: "他在医院住了一个月", pingYing: " tā zài yīyuàn zhùle yīge yuè", translation: " он пролежал в больнице один месяц"),
             Example(chinese: "医生在医院工作", pingYing: " yīshēng zài yīyuàn gōngzuò ", translation: " врач работает в госпитале"),
             //Example(chinese: "", pingYing: " bāzhāng túpiàn", translation: " восемь картинок")
        ]),
        CharacterData(character: "商店", imageName: "shop", pingYing: "shāngdiàn", translation: "магазин, лавка", examples: [
            Example(chinese: "妈妈去商店买东西了", pingYing: " māma qù shāngdiàn le", translation: " Мама ушла в магазин"),
            Example(chinese: "妈妈去商店了", pingYing: " māma qù shāngdiàn mǎi dōngxi le", translation: " Мама ушла в магазин за покупками"),
            //Example(chinese: "爸爸比妈妈大", pingYing: " bàba bí māma dà", translation: " папа старше мамы"),
            ])
    ]
    private init(){}
}

