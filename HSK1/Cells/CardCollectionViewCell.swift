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
    @IBOutlet weak var detailTranslationLabel: UILabel!
    @IBOutlet weak var exampleSoundbuttonOne: UIButton!
    @IBOutlet weak var exampleSoundbuttonTwo: UIButton!
    @IBOutlet weak var characterLabel: UILabel!
    @IBOutlet weak var characterViewImage: UIImageView!
    @IBOutlet weak var characterDetailViewImage: UIImageView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var exampleSoundButton: UIButton!
    
    var player: AVAudioPlayer?
    var character: Character?
    
    func setCharacter(character: Character) {
        
        self.character = character
        //CharacterViewSettings
        
        self.characterLabel.text = character.name
        self.characterView.layer.cornerRadius = 5
        
        self.characterView.layer.shadowOffset = CGSize(width: 0, height: 3 )
        self.characterView.layer.shadowOpacity = 1.0
        self.characterView.layer.shadowRadius = 2
        self.characterView.layer.shadowColor = UIColor.green.cgColor
        
        //DetailViewSettings
        self.detailCharacterLabel.text = character.name
        self.detailView.layer.cornerRadius = 5
        self.playButton.setTitle(character.pingYing, for: .normal)
        self.detailCharacterLabel.layer.cornerRadius = 0
        self.detailTranslationLabel.layer.cornerRadius = 0
        self.detailTranslationLabel.text = character.translation
        
        if character.isFlipped == true {
            UIView.transition(from: characterView, to: detailView, duration: 0, options: [.transitionFlipFromRight,.showHideTransitionViews], completion: nil)
             }
    else {
            UIView.transition(from: detailView, to: characterView, duration: 0, options: [.transitionFlipFromTop,.showHideTransitionViews], completion: nil)
        }
    }
    
    @IBAction func playButtonAction(_ sender: Any) {
        playsound(name: character?.name ?? "")
    }
    @IBAction func exampleSoundAction(_ sender: UIButton) {
        
    }
    @IBAction func exampleSoundOneAction(_ sender: Any) {
        
    }
    @IBAction func exampleSoundTwoAction(_ sender: Any) {
        
    }
    func flipCard() {
        UIView.transition(from: characterView, to: detailView, duration: 0.5, options: [.transitionFlipFromLeft,.showHideTransitionViews], completion: nil)
    }
    func flipBack() {
        UIView.transition(from: detailView, to: characterView, duration: 0.5, options: [.transitionFlipFromTop,.showHideTransitionViews], completion: nil)
    }
    func playsound(name: String) {
        let urlString = Bundle.main.path(forResource: name, ofType: "mp3")
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

