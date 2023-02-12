//
//  MainMenuViewController.swift
//  HSK1
//
//  Created by mac on 28.06.2022.
//

import UIKit

class MainMenuViewController: UICollectionViewController {
    let menuItems = MenuItem.getItems()
    private let edgeInsets = UIEdgeInsets(top: 20, left: 30, bottom: 20, right: 30)
    private var interLineSpacing = 5
    private let screenWindh = UIScreen.main.bounds.width
    private let screeHeight = UIScreen.main.bounds.height
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
            if UIDevice.current.orientation.isLandscape {
                collectionView.collectionViewLayout = createLandscapeLayout()
            } else {
                collectionView.collectionViewLayout = createLayout()
            }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UICollectionView.animate(withDuration: 0.2, delay: 0, options: .beginFromCurrentState) {
            for cell in self.collectionView.visibleCells {
                cell.transform = CGAffineTransform(scaleX: 0.9 , y: 0.9)
            }
        } completion: { bool in
            UICollectionView.animate(withDuration: 0.2, delay: 0, options: .beginFromCurrentState) {
                for cell in self.collectionView.visibleCells {
                    cell.transform = CGAffineTransform(scaleX: 1 , y: 1)
                }
            }
        }
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if UIDevice.current.orientation.isLandscape {
            collectionView.collectionViewLayout = createLandscapeLayout()
        } else {
            collectionView.collectionViewLayout = createLayout()
        }
    }
    
    
    
    func createLandscapeLayout() -> UICollectionViewCompositionalLayout {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.5)))
        item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 100, bottom: 2, trailing: 100)
        let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)), subitems: [item,item])
        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    
    func createLayout() -> UICollectionViewCompositionalLayout {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.3)))
        item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 50, bottom: 2, trailing: 50)
        let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)), subitems: [item,item])
        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        let item = menuItems[indexPath.row]
        cell.imageView.image = UIImage(named: item.imageName)
        cell.cellLabel.text = item.labelText
        cell.imageCharacter.text = item.imageCharacter
        cell.imageView.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        cell.imageView.layer.cornerRadius = 5
        cell.layer.cornerRadius = 5
        cell.cellLabel.layer.cornerRadius = 5
        return cell
    }
 
    // MARK: UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CollectionViewCell
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseInOut, animations: {
            cell.transform = CGAffineTransform.init(scaleX: 1.0, y: 1.0)
            cell.transform = CGAffineTransform.init(scaleX: 0.9, y: 0.9)
        }) { bool in
            if cell.cellLabel.text == "练习" {
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            let quizVC = storyboard.instantiateViewController(withIdentifier: "topicVC") as! TopicViewcontrollerViewController
                _ = UIStoryboardSegue.init(identifier: "topicSegue", source: self, destination: quizVC)
            self.present(quizVC, animated: true)
            } else {
                self.performSegue(withIdentifier: "topicSegue", sender: nil)
            }
        }
    }
}

/*
extension MainMenuViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        edgeInsets
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        CGFloat(interLineSpacing)
    }
    
    /*
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
     
             let itemWindth = screenWindh - CGFloat(2*edgeInsets.right)
             let itemHeight = screeHeight/4
    
        return CGSize(width: itemWindth, height: itemHeight)
    }
     */
     
}
 
 */
