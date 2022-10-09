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
