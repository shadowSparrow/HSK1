//
//  CollectionViewCell.swift
//  HSK1
//
//  Created by mac on 28.06.2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageCharacter: UILabel!
    @IBOutlet weak var cellLabel: UILabel!
}
extension CollectionViewCell {
    func setCell(image: UIImage,label:String){
        self.layer.cornerRadius = 5
        self.imageView.image = image
        self.cellLabel.text = label
    }
}




