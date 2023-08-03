//
//  TopicViewcontrollerViewController.swift
//  HSK1
//
//  Created by mac on 11.01.2023.
//

import UIKit

class TopicViewcontrollerViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var topicCollectionView: UICollectionView!
    
    private let topics = Topic.getTopics()
    
    var text: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = text
        topicCollectionView.dataSource = self
        topicCollectionView.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        showLayout()
    }
    override func viewDidAppear(_ animated: Bool) {
        //tabBarController?.tabBar.isHidden = true
       showLayout()
    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        showLayout()
    }
    
}

extension TopicViewcontrollerViewController {
    
    //MARK: - Layout
    private func showLayout() {
        if UIDevice.current.orientation.isLandscape {
            topicCollectionView.collectionViewLayout = createLandscapeLayout()
        } else {
            topicCollectionView.collectionViewLayout = createLayout()
        }
        animateLayout()
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
    
    private func animateLayout() {
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
}

extension TopicViewcontrollerViewController {
    //MARK: - CollectionVCdelegateAndDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        topics.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "topicCell", for: indexPath) as! TopicCellCollectionViewCell
        cell.setCell(image: UIImage(named:topics[indexPath.row].rawValue) ?? UIImage(), label: topics[indexPath.row].rawValue)
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
            lernVC.text = cell.cellLabel.text
            switch cell.cellLabel.text {
            case Topics.Family.rawValue:
                lernVC.characters = Character.getCharacters(charactersData: DataManager.shared.familyCharacters)
            case Topics.Travel.rawValue:
                lernVC.characters = Character.getCharacters(charactersData: DataManager.shared.travelCharacters)
            case Topics.Education.rawValue:
                lernVC.characters = Character.getCharacters(charactersData: DataManager.shared.educationCharacters)
            case Topics.Objects.rawValue:
                lernVC.characters = Character.getCharacters(charactersData: DataManager.shared.objectCharacters)
            case Topics.Food.rawValue:
                lernVC.characters = Character.getCharacters(charactersData: DataManager.shared.foodCharacters)
            case Topics.Persons.rawValue:
                lernVC.characters = Character.getCharacters(charactersData: DataManager.shared.nounsCharacters)
            case Topics.Count.rawValue:
                lernVC.characters = Character.getCharacters(charactersData: DataManager.shared.countCharacters)
            case Topics.Numbers.rawValue:
                lernVC.characters = Character.getCharacters(charactersData: DataManager.shared.numberCharacters)
            case Topics.Time.rawValue:
                lernVC.characters = Character.getCharacters(charactersData: DataManager.shared.timeCharacters)
            case Topics.Locations.rawValue:
                lernVC.characters = Character.getCharacters(charactersData: DataManager.shared.placeCharacters)
            case Topics.Adjectives.rawValue:
                lernVC.characters = Character.getCharacters(charactersData: DataManager.shared.adjectivesCharacters)
            case Topics.Actions.rawValue:
                lernVC.characters = Character.getCharacters(charactersData: DataManager.shared.verbsCharacters)
            case Topics.Phrazes.rawValue:
                lernVC.characters = Character.getCharacters(charactersData: DataManager.shared.phrazesCharacters)
            case Topics.Particles.rawValue:
                lernVC.characters = Character.getCharacters(charactersData: DataManager.shared.particlesCharacters)
            default:
                lernVC.characters = Character.getCharacters(charactersData: DataManager.shared.nounsCharacters)
            }
            self.show(lernVC, sender: nil)
             }
    }
    private func getTopicsGards(label: UILabel) {
    }
}
