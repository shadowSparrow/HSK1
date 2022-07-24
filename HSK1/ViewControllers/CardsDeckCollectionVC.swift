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
        //collectionView.isPagingEnabled = true
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
        
        cell.layer.cornerRadius = 20
        cell.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
        //cell.layer.borderWidth = 1
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
            //cell.playsound()
            character.isFlipped = true
        } else {
            cell.flipBack()
            character.isFlipped = false
        }
    }
    
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let centerX = scrollView.contentOffset.x + scrollView.frame.size.width/2
        for cell in collectionView.visibleCells {
                var offsetX = centerX - cell.center.x
                if offsetX < 0 {
                    offsetX *= -1
                }
            
            
                
            UIView.animate(withDuration: 0.09, delay: 0, options: .curveLinear, animations: {
                cell.transform = CGAffineTransform(scaleX: 1, y: 1)
                    if offsetX > 50 {
                            let offsetPercentage = (offsetX - 50) / self.view.bounds.width
                        var scaleX = 1-offsetPercentage
                            if scaleX < 0.6 {
                                scaleX = 0.6
                        }
                        cell.transform = CGAffineTransform(scaleX: scaleX, y: scaleX)
                    }
            }, completion: nil)
            
        
            }
    }
    /*
     func scrollViewDidScroll(_ scrollView: UIScrollView) {
         let centerX = scrollView.contentOffset.x + scrollView.frame.size.width/2
         for cell in mainCollectionView.visibleCells {

             var offsetX = centerX - cell.center.x
             if offsetX < 0 {
                 offsetX *= -1
             }

             cell.transform = CGAffineTransform(scaleX: 1, y: 1)
             if offsetX > 50 {

                 let offsetPercentage = (offsetX - 50) / view.bounds.width
                 var scaleX = 1-offsetPercentage

                 if scaleX < 0.8 {
                     scaleX = 0.8
                 }
                 cell.transform = CGAffineTransform(scaleX: scaleX, y: scaleX)
             }
         }
     }
     */
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




