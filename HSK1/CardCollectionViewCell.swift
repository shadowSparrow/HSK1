//
//  CardCollectionViewCell.swift
//  HSK1
//
//  Created by mac on 30.06.2022.
//

import UIKit
import AVFoundation

class CardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var characterView: UIView!
    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var detailCharacterLabel: UILabel!
    @IBOutlet weak var detailPingYingLabel: UILabel!
    @IBOutlet weak var detailTranslationLabel: UILabel!
    @IBOutlet weak var detailExamplesLabel: UILabel!
    @IBOutlet weak var characterLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    
    var player: AVAudioPlayer?
    var character: Character?
    
    func setCharacter(character: Character) {
        self.character = character
        self.characterLabel.text = character.name
        self.detailCharacterLabel.text = character.name
        self.detailPingYingLabel.text = character.pingYing
        //self.detailCharacterLabel.backgroundColor = .gray
        //self.detailPingYingLabel.backgroundColor = .gray
        //self.detailTranslationLabel.backgroundColor = .gray
        self.detailTranslationLabel.text = character.translation
        self.detailExamplesLabel.text = character.examples
        
        if character.isFlipped == true {
            UIView.transition(from: characterView, to: detailView, duration: 0, options: [.transitionFlipFromRight,.showHideTransitionViews], completion: nil)
             }
    else {
            UIView.transition(from: detailView, to: characterView, duration: 0, options: [.transitionFlipFromTop,.showHideTransitionViews], completion: nil)
        }
    }
    
    @IBAction func playAction(_ sender: Any) {
        playsound()
    }
    
    func flipCard() {
        UIView.transition(from: characterView, to: detailView, duration: 0.5, options: [.transitionFlipFromLeft,.showHideTransitionViews], completion: nil)
        playButton.isHidden = true
    }
    
    func flipBack() {
        UIView.transition(from: detailView, to: characterView, duration: 0.5, options: [.transitionFlipFromTop,.showHideTransitionViews], completion: nil)
        playButton.isHidden = false
    }
    
    func playsound() {
        let urlString = Bundle.main.path(forResource: "爱", ofType: "mp3")
        do {
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            guard let urlString = urlString else {return}
            player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
            guard let player = player else {
                return
            }
            player.play()
        } catch {
            print("soundError")
        }
    }
        
}

