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
    var characters = ["零", "一", "二", "三", "四", "五", "六", "七", "八","九","十","本","个"]
    private init(){}
}

