//
//  TopicData.swift
//  HSK1
//
//  Created by mac on 15.01.2023.
//

import Foundation

class Topic {
    static func getTopics() -> [Topics] {
        let topicNames = DataManager.shared.topicNames
        return topicNames
    }
}
