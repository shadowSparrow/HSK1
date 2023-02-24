//
//  TopicViewcontrollerViewController.swift
//  HSK1
//
//  Created by mac on 11.01.2023.
//

import UIKit

class TopicViewcontrollerViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var topicCollectionView: UICollectionView!
    let topics = Topic.getTopics()
    override func viewDidLoad() {
        super.viewDidLoad()
        topicCollectionView.dataSource = self
        topicCollectionView.delegate = self
    }
    override func viewWillLayoutSubviews() {
        if UIDevice.current.orientation.isLandscape {
            topicCollectionView.collectionViewLayout = createLandscapeLayout()
        } else {
            topicCollectionView.collectionViewLayout = createLayout()
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        UICollectionView.animate(withDuration: 0.2, delay: 0, options: .beginFromCurrentState) {
            for cell in self.topicCollectionView.visibleCells {
                cell.transform = CGAffineTransform(scaleX: 0.9 , y: 0.9)
            }
        } completion: { bool in
            UICollectionView.animate(withDuration: 0.2, delay: 0, options: .beginFromCurrentState) {
                for cell in self.topicCollectionView.visibleCells {
                    cell.transform = CGAffineTransform(scaleX: 1 , y: 1)
                }
            }
        }
    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if UIDevice.current.orientation.isLandscape {
            topicCollectionView.collectionViewLayout = createLandscapeLayout()
        } else {
            topicCollectionView.collectionViewLayout = createLayout()
        }
    }
     private func createLayout() -> UICollectionViewCompositionalLayout {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1)))
        item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
        let itemTwo = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.5)))
        itemTwo.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.5)), subitems: [item,item])
        let groupTwo = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.5)), subitems: [group,itemTwo])
       let section = NSCollectionLayoutSection(group: groupTwo)
         section.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
       let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
   private func createLandscapeLayout() -> UICollectionViewCompositionalLayout {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.5)))
        item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 20, bottom: 2, trailing: 20)
        let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)), subitems: [item,item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        topics.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "topicCell", for: indexPath) as! TopicCellCollectionViewCell
        cell.setCell(image: UIImage(named:topics[indexPath.row])!, label: topics[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! TopicCellCollectionViewCell
        UIView.animate(withDuration: 0.2, delay: 0, options: .beginFromCurrentState) {
            cell.transform = CGAffineTransform.init(scaleX: 1.0, y: 1.0)
            cell.transform = CGAffineTransform.init(scaleX: 0.9, y: 0.9)
        } completion: { Bool in
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            let lernVC = storyboard.instantiateViewController(withIdentifier: "learnVC") as! CardsDeckCollectionVC
            switch cell.cellLabel.text {
            case "Family":
                lernVC.characters = Character.getCharacters(charactersData: DataManager.shared.familyCharacters)
            case "Travel":
                lernVC.characters = Character.getCharacters(charactersData: DataManager.shared.travelCharacters)
            case "Education":
                lernVC.characters = Character.getCharacters(charactersData: DataManager.shared.educationCharacters)
            case "Objects":
                lernVC.characters = Character.getCharacters(charactersData: DataManager.shared.objectCharacters)
            case "Food":
                lernVC.characters = Character.getCharacters(charactersData: DataManager.shared.foodCharacters)
            case "Persons":
                lernVC.characters = Character.getCharacters(charactersData: DataManager.shared.nounsCharacters)
            case "Count":
                lernVC.characters = Character.getCharacters(charactersData: DataManager.shared.countCharacters)
            case "Numbers":
                lernVC.characters = Character.getCharacters(charactersData: DataManager.shared.numberCharacters)
            case "Time":
                lernVC.characters = Character.getCharacters(charactersData: DataManager.shared.timeCharacters)
            case "Locations":
                lernVC.characters = Character.getCharacters(charactersData: DataManager.shared.placeCharacters)
            case "Adjectives":
                lernVC.characters = Character.getCharacters(charactersData: DataManager.shared.adjectivesCharacters)
            case "Actions":
                lernVC.characters = Character.getCharacters(charactersData: DataManager.shared.verbsCharacters)
            case "Phrazes":
                lernVC.characters = Character.getCharacters(charactersData: DataManager.shared.phrazesCharacters)
            case "Particles":
                lernVC.characters = Character.getCharacters(charactersData: DataManager.shared.particlesCharacters)
            default:
                lernVC.characters = Character.getCharacters(charactersData: DataManager.shared.nounsCharacters)
            }
            self.show(lernVC, sender: nil)
             }
    }
}
