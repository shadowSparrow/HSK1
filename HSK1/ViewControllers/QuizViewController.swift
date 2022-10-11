//
//  QuizViewController.swift
//  HSK1
//
//  Created by mac on 09.10.2022.
//

import UIKit

class QuizViewController: UIViewController {

    var characters: [Character] = Character.getCharacters()
    let pingYingView = UILabel()
    var firstVariantButton: UIButton!
    var secondVariantButton: UIButton!
    var thirdVariantButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let parent = self.view!
        
        parent.backgroundColor = .gray
        pingYingView.backgroundColor = .white
        pingYingView.layer.masksToBounds = true
        pingYingView.layer.cornerRadius = CGFloat(25)
        pingYingView.textAlignment = .center
        pingYingView.text = characters.randomElement()?.pingYing
        parent.addSubview(pingYingView)
        
        pingYingView.translatesAutoresizingMaskIntoConstraints = false
        pingYingView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        pingYingView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        pingYingView.centerXAnchor.constraint(equalTo: parent.centerXAnchor, constant: 0).isActive = true
        pingYingView.centerYAnchor.constraint(equalTo: parent.centerYAnchor, constant: -150).isActive = true
        
        firstVariantButton = createAnswerVariant(text: characters.randomElement()!.name)
        parent.addSubview(firstVariantButton)
        firstVariantButton.centerXAnchor.constraint(equalTo: parent.centerXAnchor, constant: 0).isActive = true
        firstVariantButton.centerYAnchor.constraint(equalTo: parent.centerYAnchor, constant: 0).isActive = true

        secondVariantButton = createAnswerVariant(text: characters.randomElement()!.name)
        parent.addSubview(secondVariantButton)
        secondVariantButton.centerXAnchor.constraint(equalTo: parent.centerXAnchor).isActive = true
        secondVariantButton.topAnchor.constraint(equalTo: firstVariantButton.bottomAnchor, constant: 10).isActive = true
        
        thirdVariantButton = createAnswerVariant(text: characters.randomElement()!.name)
        parent.addSubview(thirdVariantButton)
        thirdVariantButton.centerXAnchor.constraint(equalTo: parent.centerXAnchor).isActive = true
        thirdVariantButton.topAnchor.constraint(equalTo: secondVariantButton.bottomAnchor, constant: 10).isActive = true
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
