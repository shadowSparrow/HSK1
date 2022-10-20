//
//  QuizViewController.swift
//  HSK1
//
//  Created by mac on 09.10.2022.
//

import UIKit

class QuizViewController: UIViewController {

    var characters: [Character] = Character.getCharacters().shuffled()
    let pingYingView = UILabel()
    var firstVariantButton: UIButton!
    var secondVariantButton: UIButton!
    var thirdVariantButton: UIButton!
    var pingYingRandomElement: Character?
    var firstVariant: String?
    var secondVariant: String?
    var thirdVariant: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let parent = self.view!
        parent.backgroundColor = .gray
        pingYingView.backgroundColor = .white
        pingYingView.layer.masksToBounds = true
        pingYingView.layer.cornerRadius = CGFloat(25)
        pingYingView.textAlignment = .center
        
        pingYingRandomElement = characters.randomElement()
        pingYingView.text = pingYingRandomElement?.pingYing
        parent.addSubview(pingYingView)
        
        pingYingView.translatesAutoresizingMaskIntoConstraints = false
        pingYingView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        pingYingView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        pingYingView.centerXAnchor.constraint(equalTo: parent.centerXAnchor, constant: 0).isActive = true
        pingYingView.centerYAnchor.constraint(equalTo: parent.centerYAnchor, constant: -150).isActive = true
        
        firstVariantButton = createAnswerVariant(text: characters[0].name)
        parent.addSubview(firstVariantButton)
        firstVariantButton.centerXAnchor.constraint(equalTo: parent.centerXAnchor, constant: 0).isActive = true
        firstVariantButton.centerYAnchor.constraint(equalTo: parent.centerYAnchor, constant: 0).isActive = true
        
        secondVariantButton = createAnswerVariant(text: characters[1].name)
        parent.addSubview(secondVariantButton)
        secondVariantButton.centerXAnchor.constraint(equalTo: parent.centerXAnchor).isActive = true
        secondVariantButton.topAnchor.constraint(equalTo: firstVariantButton.bottomAnchor, constant: 10).isActive = true
        
        thirdVariantButton = createAnswerVariant(text: characters[2].name)
        parent.addSubview(thirdVariantButton)
        thirdVariantButton.centerXAnchor.constraint(equalTo: parent.centerXAnchor).isActive = true
        thirdVariantButton.topAnchor.constraint(equalTo: secondVariantButton.bottomAnchor, constant: 10).isActive = true
        
        firstVariantButton.addTarget(self, action: #selector(rightOrWrongVariant), for: .touchDown)
        secondVariantButton.addTarget(self, action: #selector(rightOrWrongVariant), for: .touchDown)
        thirdVariantButton.addTarget(self, action: #selector(rightOrWrongVariant), for: .touchDown)
    }
    

    @objc func rightOrWrongVariant(sender: UIButton) {
        var _: UIButton = sender
        if sender.titleLabel?.text == pingYingRandomElement?.name {
            sender.backgroundColor = .green
        } else {
            sender.backgroundColor = .red
        }
    }
    
    func createAnswerVariant(text: String) -> UIButton {
        let variant = UIButton()
        variant.backgroundColor = .white
        variant.layer.cornerRadius = CGFloat(25)
        variant.setTitle(text, for: .normal)
        variant.setTitleColor(.black, for: .normal)
        variant.titleLabel?.layer.masksToBounds = true
        variant.titleLabel?.textColor = UIColor.black
        variant.translatesAutoresizingMaskIntoConstraints = false
        variant.widthAnchor.constraint(equalToConstant: 200).isActive = true
        variant.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return variant
    }
}
