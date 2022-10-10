//
//  QuizViewController.swift
//  HSK1
//
//  Created by mac on 09.10.2022.
//

import UIKit

class QuizViewController: UIViewController {

    var characters: [Character] = Character.getCharacters()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let parent = self.view!
        let view = UILabel()
        let secondView = UILabel()
        
        parent.backgroundColor = .gray
        view.backgroundColor = .white
        view.layer.masksToBounds = true
        view.layer.cornerRadius = CGFloat(25)
        
        view.font.withSize(5)
        view.textAlignment = .center
        view.text = characters[0].pingYing
    
        secondView.backgroundColor = .white
        secondView.layer.masksToBounds = true
        secondView.layer.cornerRadius = CGFloat(25)
        secondView.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        secondView.textAlignment = .center
        secondView.text = characters[2].name
        parent.addSubview(view)
        parent.addSubview(secondView)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 150).isActive = true
        view.heightAnchor.constraint(equalToConstant: 150).isActive = true
        view.centerXAnchor.constraint(equalTo: parent.centerXAnchor, constant: 0).isActive = true
        view.centerYAnchor.constraint(equalTo: parent.centerYAnchor, constant: -150).isActive = true
        
        secondView.translatesAutoresizingMaskIntoConstraints = false
        secondView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        secondView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        secondView.centerXAnchor.constraint(equalTo: parent.centerXAnchor, constant: 0).isActive = true
        secondView.centerYAnchor.constraint(equalTo: parent.centerYAnchor, constant: 0).isActive = true
        
        let variant = createAnswerVariant(text: characters[0].name)
        parent.addSubview(variant)
        variant.centerXAnchor.constraint(equalTo: parent.centerXAnchor).isActive = true
        variant.topAnchor.constraint(equalTo: secondView.bottomAnchor, constant: 10).isActive = true
        
        let secondVariant = createAnswerVariant(text: characters[1].name)
        parent.addSubview(secondVariant)
        secondVariant.centerXAnchor.constraint(equalTo: parent.centerXAnchor).isActive = true
        secondVariant.topAnchor.constraint(equalTo: variant.bottomAnchor, constant: 10).isActive = true
    }
    
    func createAnswerVariant(text: String) -> UILabel {
        let variant = UILabel()
        variant.backgroundColor = .white
        variant.layer.masksToBounds = true
        variant.layer.cornerRadius = CGFloat(25)
        variant.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        variant.textAlignment = .center
        variant.text = text
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
