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
    @IBOutlet weak var pageControl: UIPageControl!
    var characters: [Character] = Character.getCharacters()
    private let edgeInsets = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
    private let interLineSpacing = 0
    private let screenWindh = UIScreen.main.bounds.width
    private let screenHeight = UIScreen.main.bounds.height
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.contentInset =  edgeInsets
    }
    override func viewWillAppear(_ animated: Bool) {
        if UIDevice.current.orientation.isLandscape {
            let layout = createHorizontalLayout()
            collectionView.collectionViewLayout = layout
        } else {
            let layout = createLayout()
            collectionView.collectionViewLayout = layout
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        //pageControl.isHidden = true
    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if UIDevice.current.orientation.isLandscape {
            let layout = createHorizontalLayout()
            collectionView.collectionViewLayout = layout
        } else {
            let layout = createLayout()
            //layout.configuration.scrollDirection = .horizontal
            collectionView.collectionViewLayout = layout
        }
    }
    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        pageControl.numberOfPages = characters.count
        return characters.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CardCollectionViewCell
        cell.layer.cornerRadius = 5
        cell.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
        let character = characters[indexPath.row]
        cell.setCharacter(character: character)
        return cell
    }
    // MARK: UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CardCollectionViewCell
        
        UIView.animate(withDuration: 0.2, delay: 0, options: .beginFromCurrentState) {
            cell.transform = CGAffineTransform.init(scaleX: 0.9, y: 0.9)
            
        } completion: { bool in
            UIView.animate(withDuration: 0.5, delay: 0, options: .beginFromCurrentState) {
                let character = self.characters[indexPath.row]
                if character.isFlipped == false {
                    cell.flipCard()
                    //cell.playsound(name: character.name)
                    character.isFlipped = true
                } else {
                    cell.flipBack()
                    character.isFlipped = false
                }
            } completion: { bool in
                UIView.animate(withDuration: 0.2, delay: 0, options: .beginFromCurrentState) {
                cell.transform = CGAffineTransform.init(scaleX: 1, y: 1)
                }
               }
              }
             }
            }
func createHorizontalLayout() -> UICollectionViewCompositionalLayout {
    let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
    item.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 100, bottom: 4, trailing: 100)
    let horizontalGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)), subitems: [item])
    
    horizontalGroup.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4)
    horizontalGroup.interItemSpacing = .flexible(24)
    let section = NSCollectionLayoutSection(group: horizontalGroup)
    section.orthogonalScrollingBehavior = .groupPaging
    //section.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 5)
    let layout = UICollectionViewCompositionalLayout(section: section)
    return layout
}
func createLayout() -> UICollectionViewCompositionalLayout {
    let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
    let horizontalGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)), subitems: [item,item])
    let section = NSCollectionLayoutSection(group: horizontalGroup)
    section.orthogonalScrollingBehavior = .paging
    section.contentInsets = NSDirectionalEdgeInsets(top: 170, leading: 5, bottom: 170, trailing: 5)
    let layout = UICollectionViewCompositionalLayout(section: section)
    return layout
}
extension CardsDeckCollectionVC: UICollectionViewDelegateFlowLayout {
    /*
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: screenWindh, height: screenHeight)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        CGFloat(interLineSpacing)
    }
    */
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        edgeInsets
    }
}
/*
   override func scrollViewDidScroll(_ scrollView: UIScrollView) {
       let centerX = scrollView.contentOffset.x + scrollView.frame.size.width / 2
       for cell in collectionView.visibleCells {
           var offsetX = centerX - cell.center.x
           if offsetX < 0 {
                   offsetX *= -1
       }
           UIView.animate(withDuration: 0.1, delay: 0, options: [.curveEaseIn,.allowUserInteraction], animations: {
               cell.transform = CGAffineTransform(scaleX: 1, y: 1)
               if offsetX > 50 {
       let offsetPercentage = (offsetX - 50) / self.view.bounds.width
       var scaleX = 1-offsetPercentage
                           if scaleX < 0.6 {
                                   scaleX = 0.6
                       }
                       cell.transform = CGAffineTransform(scaleX: scaleX, y: scaleX)
                   }
           }, completion: nil)
           }
       pageControl.currentPage = Int(
           (collectionView.contentOffset.x / collectionView.frame.width).rounded(.toNearestOrAwayFromZero)
               )
   }
*/
   /*
   override func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
       let systemSoundID: SystemSoundID = 1104
       AudioServicesPlaySystemSound(systemSoundID)
   }
   */


