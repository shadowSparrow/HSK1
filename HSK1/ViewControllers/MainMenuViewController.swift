//
//  MainMenuViewController.swift
//  HSK1
//
//  Created by mac on 28.06.2022.
//

import UIKit

class MainMenuViewController: UICollectionViewController {
    let menuItems = MenuItem.getItems()
    override func viewDidLoad() {
        super.viewDidLoad()
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        /*
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let topicVC = storyboard.instantiateViewController(withIdentifier: "topicVC") as! TopicViewcontrollerViewController
        if UIDevice.current.orientation.isLandscape {
            topicVC.layout = topicVC.createLandscapeLayout()
        } else {
            topicVC.layout = topicVC.createLayout()
        }
         */
    }
     private func createLandscapeLayout() -> UICollectionViewCompositionalLayout {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.5)))
        item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 100, bottom: 2, trailing: 100)
        let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)), subitems: [item,item])
        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    private func createLayout() -> UICollectionViewCompositionalLayout {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.3)))
        item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 50, bottom: 2, trailing: 50)
        let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)), subitems: [item,item])
        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuItems.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        let item = menuItems[indexPath.row]
        
        cell.setCell(image: UIImage(named: item.imageName)!, label: item.labelText)
        return cell
    }
    // MARK: UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CollectionViewCell
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseInOut, animations: {
            cell.transform = CGAffineTransform.init(scaleX: 1.0, y: 1.0)
            cell.transform = CGAffineTransform.init(scaleX: 0.9, y: 0.9)
        }) { bool in
                self.performSegue(withIdentifier: "topicSegue", sender: nil)
            }
        }
    }

