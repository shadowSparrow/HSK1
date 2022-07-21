//
//  DataMananger.swift
//  HSK1
//
//  Created by mac on 29.06.2022.
//

import Foundation

class DataManager {
    static let shared = DataManager()
    var imageNames = ["cardsDeck","exercises", "dragon"]
    var labelNames = ["КОЛОДА", "УПРАЖНЯЙСЯ", "DRAGONCHIC"]
    var characters =
    ["爱":["爱","ài","любить, любовь, любимый","爱祖国 [ài zǔguó] любить родину", "母爱 [mǔ’ài] материнская любовь", "爱女 [àinǚ] любимая дочь"], "八":["八","bā","восемь, восьмой, разделять","八个月 [bāge yuè] восемь месяцев", "第八个 [dì bāge] восьмой", "八张图片 [bāzhāng túpiàn] восемь картинок"],"爸爸":["爸爸","bàba","папа, тятя, отец","这是我爸爸 [zhèshì wǒbàba] это мой отец", "他爸爸很高 [tābàba hěngāo] его папа высокий", "爸爸比妈妈大 [bàba bí māma dà] папа старше мамы"]]
    private init(){}
}

