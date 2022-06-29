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
    private init(){}
}

