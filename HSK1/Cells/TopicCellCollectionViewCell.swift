//
//  TopicCellCollectionViewCell.swift
//  HSK1
//
//  Created by mac on 13.01.2023.
//

import UIKit

class TopicCellCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var topicImageView: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!
}
extension TopicCellCollectionViewCell {
    func setCell(image: UIImage, label: String) {
        self.layer.cornerRadius = 5
        self.topicImageView.image = image
        self.cellLabel.text = label
    }
}
