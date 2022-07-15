//
//  CardsDeckCollectionVC.swift
//  HSK1
//
//  Created by mac on 29.06.2022.
//

import UIKit
import AVFoundation

private let reuseIdentifier = "cell"
class CardsDeckCollectionVC: UICollectionViewController {
    var characters: [Character] = Character.getCharacters()
    private let edgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    private let interLineSpacing = 0
    private let screenWindh = UIScreen.main.bounds.width
    private let screenHeight = UIScreen.main.bounds.height

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.isPagingEnabled = true
        collectionView.contentInset =  UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
    }
    
    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return characters.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CardCollectionViewCell
        //cell.characterLabel.backgroundColor = .gray
        cell.backgroundColor = .systemIndigo
        cell.layer.cornerRadius = 20
        cell.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
        cell.layer.borderWidth = 1
        let character = characters[indexPath.row]
        cell.setCharacter(character: character)
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CardCollectionViewCell
        let character = characters[indexPath.row]
        if character.isFlipped == false {
            cell.flipCard()
            character.isFlipped = true
        } else {
            cell.flipBack()
            character.isFlipped = false
        }
    }
    override func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let systemSoundID: SystemSoundID = 1104
        AudioServicesPlaySystemSound(systemSoundID)
    }
}
extension CardsDeckCollectionVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: screenWindh, height: 500)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        CGFloat(interLineSpacing)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        edgeInsets
    }
}
