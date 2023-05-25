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
    
    var currentPage: Int = 0
    
    var characters: [Character] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        pageControl.numberOfPages = characters.count
    }
    
    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characters.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CardCollectionViewCell
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
                
    override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let windth = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / windth)
        pageControl.currentPage = currentPage
    }
}

extension CardsDeckCollectionVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height/1.5)
    }
}

private func createLayout() -> UICollectionViewCompositionalLayout {
    let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
    let horizontalGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)), subitems: [item])
    
    horizontalGroup.contentInsets = NSDirectionalEdgeInsets(top: 20 , leading: 5, bottom: 120, trailing: 5)
    let section = NSCollectionLayoutSection(group: horizontalGroup)
    section.orthogonalScrollingBehavior = .groupPagingCentered
    section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 5, bottom: 120, trailing: 5)
    let layout = UICollectionViewCompositionalLayout(section: section)
    return layout
}

