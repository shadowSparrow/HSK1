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
        CharacterData(character: "爱", imageName: "learnItem", pingYing: "ài", translation: "любить, любовь, любимый", examples: [
            Example(chinese: "爱祖国", pingYing: "ài zǔguó", translation: "любить родину"),
            Example(chinese: "母爱", pingYing: "mǔ’ài", translation: "материнская любовь"),
            Example(chinese: "爱女", pingYing: "àinǚ", translation: "любимая дочь")
        ]),
        CharacterData(character: "八", imageName: "trainItem", pingYing: "bā", translation: "восемь, восьмой, разделять", examples: [
         
             Example(chinese: "八个月", pingYing: "bāge yuè", translation: "восемь месяцев"),
             Example(chinese: "第八个", pingYing: "dì bāge", translation: "восьмой"),
             Example(chinese: "八张图片", pingYing: "bāzhāng túpiàn", translation: "восемь картинок")
        ]),
        CharacterData(character: "爸爸", imageName: "playItem", pingYing: "bàba", translation: "папа, тятя, отец", examples: [
            Example(chinese: "这是我爸爸", pingYing: "zhèshì wǒbàba", translation: "это мой отец"),
            Example(chinese: "他爸爸很高", pingYing: "tābàba hěngāo", translation: "его папа высокий"),
            Example(chinese: "爸爸比妈妈大", pingYing: "bàba bí māma dà", translation: "папа старше мамы"),
            ])
    ]
    /*["爱":["爱","ài","любить, любовь, любимый","爱祖国 [ài zǔguó] любить родину", "母爱 [mǔ’ài] материнская любовь", "爱女 [àinǚ] любимая дочь"], "八":["八","bā","восемь, восьмой, разделять","八个月 [bāge yuè] восемь месяцев", "第八个 [dì bāge] восьмой", "八张图片 [bāzhāng túpiàn] восемь картинок"],"爸爸":["爸爸","bàba","папа, тятя, отец","这是我爸爸 [zhèshì wǒbàba] это мой отец", "他爸爸很高 [tābàba hěngāo] его папа высокий", "爸爸比妈妈大 [bàba bí māma dà] папа старше мамы"]]*/
    private init(){}
}

