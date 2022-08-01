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
        CharacterData(character: "爱", imageName: "love", pingYing: "ài", translation: "любить, любовь, любимый", examples: [
            Example(chinese: "我爱祖国", pingYing: " wǒàizǔguó", translation: " любить родину"),
            Example(chinese: "母爱", pingYing: " mǔ’ài", translation: " материнская любовь"),
            Example(chinese: "爱女", pingYing: " àinǚ", translation: " любимая дочь")
        ]),
        CharacterData(character: "八", imageName: "eight", pingYing: "bā", translation: "восемь, восьмой, разделять", examples: [
         
             Example(chinese: "八个月", pingYing: " bāge yuè", translation: " восемь месяцев"),
             Example(chinese: "第八个", pingYing: " dì bāge", translation: " восьмой"),
             Example(chinese: "八张图片", pingYing: " bāzhāng túpiàn", translation: " восемь картинок")
        ]),
        CharacterData(character: "爸爸", imageName: "father", pingYing: "bàba", translation: "папа, тятя, отец", examples: [
            Example(chinese: "这是我爸爸", pingYing: " zhèshì wǒbàba", translation: " это мой отец"),
            Example(chinese: "他爸爸很高", pingYing: " tābàba hěngāo", translation: " его папа высокий"),
            Example(chinese: "爸爸比妈妈大", pingYing: " bàba bí māma dà", translation: " папа старше мамы"),
            ])
    ]
    private init(){}
}

