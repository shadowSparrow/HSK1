//
//  CardCollectionViewCell.swift
//  HSK1
//
//  Created by mac on 30.06.2022.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var detailCharacterLabel: UILabel!
    @IBOutlet weak var detailPingYingLabel: UILabel!
    @IBOutlet weak var detailTranslationLabel: UILabel!
    @IBOutlet weak var detailExamplesLabel: UILabel!
    @IBOutlet weak var characterLabel: UILabel!
    
    var character: Character?
    
    func setCharacter(character: Character) {
        self.character = character
        self.characterLabel.text = character.name
        self.detailCharacterLabel.text = character.name
        self.detailPingYingLabel.text = character.pingYing
        self.detailCharacterLabel.backgroundColor = .gray
        self.detailPingYingLabel.backgroundColor = .gray
        self.detailTranslationLabel.backgroundColor = .gray
        self.detailTranslationLabel.text = character.translation
        self.detailExamplesLabel.text = character.examples
        
        if character.isFlipped == true {
            UIView.transition(from: characterLabel, to: detailView, duration: 0, options: [.transitionFlipFromRight,.showHideTransitionViews], completion: nil)
             }
    else {
            UIView.transition(from: detailView, to: characterLabel, duration: 0, options: [.transitionFlipFromTop,.showHideTransitionViews], completion: nil)
        }
    }
    
    func flipCard() {
        UIView.transition(from: characterLabel, to: detailView, duration: 0.5, options: [.transitionFlipFromLeft,.showHideTransitionViews], completion: nil)
    }
    
    func flipBack() {
        UIView.transition(from: detailView, to: characterLabel, duration: 0.5, options: [.transitionFlipFromTop,.showHideTransitionViews], completion: nil)
    }
        
}

