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
    var labelNames = ["Learn", "Train", "Play"]
    var characterNames = ["学习","练习","游戏"]
    var topicNames = ["Family",  "Travel", "Education","Objects", "Food", "Persons","Count","Numbers","Time","Locations","Adjectives","Phrazes","Actions","Particles"]
    var familyCharacters = [
        CharacterData(character: "爸爸", imageName: "family", pingYing: "bàba", translation: "отец" ),
        CharacterData(character: "家", imageName: "hospital", pingYing: "jiā", translation: "семья"),
        CharacterData(character: "儿子", imageName: "shop", pingYing: "érzi", translation: "сын"),
        CharacterData(character: "朋友", imageName: "love", pingYing: "péngyou", translation: "друг"),
        CharacterData(character: "人", imageName: "family", pingYing: "rén", translation: "человек" ),
        CharacterData(character: "岁", imageName: "hospital", pingYing: "suì", translation: "возраст"),
        CharacterData(character: "先生", imageName: "shop", pingYing: "xiānsheng", translation: "господин"),
        CharacterData(character: "小姐", imageName: "love", pingYing: "xiǎojiě", translation: "мисс")
         ]
    var travelCharacters = [
        CharacterData(character: "北京", imageName: "family", pingYing: "Běijīng", translation: "Пекин" ),
        CharacterData(character: "出租车", imageName: "hospital", pingYing: "такси", translation: "такси"),
        CharacterData(character: "飞机", imageName: "shop", pingYing: "fēijī", translation: "самолет"),
        CharacterData(character: "块", imageName: "love", pingYing: "kuài", translation: "юань"),
        CharacterData(character: "天气", imageName: "family", pingYing: "tiānqì", translation: "погода" ),
        CharacterData(character: "下雨", imageName: "hospital", pingYing: "xià yǔ", translation: "идет дождь"),
        CharacterData(character: "上午", imageName: "shop", pingYing: "shàngwǔ", translation: "первая половина дня"),
        CharacterData(character: "下午", imageName: "love", pingYing: "xià wǔ", translation: "вторая половина дня"),
        CharacterData(character: "中午", imageName: "shop", pingYing: "zhōngwǔ", translation: "полдень"),
        CharacterData(character: "中国", imageName: "love", pingYing: "Zhōngguó", translation: "Китай")
        
    ]
    var educationCharacters = [
        CharacterData(character: "学习", imageName: "family", pingYing: "xuéxí", translation: "учиться" ),
        CharacterData(character: "读", imageName: "hospital", pingYing: "dú", translation: "читать"),
        CharacterData(character: "说", imageName: "shop", pingYing: "shuō", translation: "говорить"),
        CharacterData(character: "写", imageName: "love", pingYing: "xiě", translation: "писать"),
        CharacterData(character: "同学", imageName: "family", pingYing: "tóngxué", translation: "однокурсник" ),
        CharacterData(character: "学生", imageName: "hospital", pingYing: "xuésheng", translation: "студент"),
        CharacterData(character: "老师", imageName: "shop", pingYing: "lǎoshī", translation: "учитель"),
        CharacterData(character: "字", imageName: "love", pingYing: "zì", translation: "иероглиф"),
        CharacterData(character: "汉语", imageName: "shop", pingYing: "Hànyǔ", translation: "китайский язык"),
        CharacterData(character: "学校", imageName: "love", pingYing: "xuéxiào", translation: "школа")
        
    ]
    
    var characters = [
        CharacterData(character: "家", imageName: "family", pingYing: "jiā", translation: "дом, семья" ),
        CharacterData(character: "医院", imageName: "hospital", pingYing: "yīyuàn", translation: "больница, госпиталь"),
        CharacterData(character: "商店", imageName: "shop", pingYing: "shāngdiàn", translation: "магазин, лавка"),
        CharacterData(character: "爱", imageName: "love", pingYing: "ài", translation: "Любить, любовь")
    ]
    private init(){}
}

