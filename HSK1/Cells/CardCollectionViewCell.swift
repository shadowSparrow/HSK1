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
    
    @IBOutlet weak var characterViewImage: UIImageView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var exampleSoundButton: UIButton!
    
    
    var player: AVAudioPlayer?
    var character: Character?
    
    func setCharacter(character: Character) {
        self.character = character
        self.characterLabel.text = character.name
        self.characterViewImage.image = UIImage(named: character.imageName)
        self.detailCharacterLabel.text = character.name
        self.detailPingYingLabel.text = character.pingYing
        self.detailTranslationLabel.text = character.translation
        self.detailExamplesLabel.text = character.examples[0].chinese
        
        if character.isFlipped == true {
            UIView.transition(from: characterView, to: detailView, duration: 0, options: [.transitionFlipFromRight,.showHideTransitionViews], completion: nil)
            playButton.isHidden = true
             }
    else {
            UIView.transition(from: detailView, to: characterView, duration: 0, options: [.transitionFlipFromTop,.showHideTransitionViews], completion: nil)
        playButton.isHidden = false 
        }
    }
    
    @IBAction func playAction(_ sender: Any) {
        playsound(name: character?.name ?? "")
    }
    
    
    @IBAction func exampleSoundAction(_ sender: Any) {
        playsound(name: detailExamplesLabel.text ?? "")
    }
    
    func flipCard() {
        UIView.transition(from: characterView, to: detailView, duration: 0.5, options: [.transitionFlipFromLeft,.showHideTransitionViews], completion: nil)
        playButton.isHidden = true
    }
    
    func flipBack() {
        UIView.transition(from: detailView, to: characterView, duration: 0.5, options: [.transitionFlipFromTop,.showHideTransitionViews], completion: nil)
        playButton.isHidden = false
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

