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
        self.characterLabel.text = character.name
        self.characterViewImage.image = UIImage(named: character.imageName)
        self.characterDetailViewImage.image = UIImage(named: character.imageName)
        self.characterDetailViewImage.layer.cornerRadius = 20
        self.detailCharacterLabel.text = character.name
        self.playButton.setTitle(character.pingYing, for: .normal)
        self.detailCharacterLabel.layer.cornerRadius = 20
        self.detailTranslationLabel.layer.cornerRadius = 20
        self.detailTranslationLabel.text = character.translation
        self.exampleSoundButton.setTitle(character.examples[0].chinese, for: .normal)
        self.exampleSoundbuttonOne.setTitle(character.examples[1].chinese, for: .normal)
        
        
        if character.examples.count <= 2 {
            self.exampleSoundbuttonTwo.isHidden = true
        } else {
            self.exampleSoundbuttonTwo.isHidden = false
            self.exampleSoundbuttonTwo.setTitle(character.examples[2].chinese, for: .normal)
        }
        
        
       
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
        playsound(name: character?.examples[0].chinese ?? "")
    }
    @IBAction func exampleSoundOneAction(_ sender: Any) {
        playsound(name: character?.examples[1].chinese ?? "")
    }
    @IBAction func exampleSoundTwoAction(_ sender: Any) {
        playsound(name: character?.examples[2].chinese ?? "")
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

