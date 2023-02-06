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
        topicCollectionView.collectionViewLayout = createLayout()
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
    
    func createLayout() -> UICollectionViewCompositionalLayout {
        
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1)))
        item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
        
        
        let itemTwo = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.5)))
        
        itemTwo.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.5)), subitems: [item,item])
        
        let groupTwo = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.5)), subitems: [group,itemTwo])
        
       let section = NSCollectionLayoutSection(group: groupTwo)
       let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        topics.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "topicCell", for: indexPath) as! TopicCellCollectionViewCell
        cell.layer.cornerRadius = 5
        cell.cellLabel.text = topics[indexPath.row]
        cell.topicImageView.image = UIImage(named: topics[indexPath.row])
        if UIDevice.current.orientation.isLandscape {
            
        } else {
            
        }
        return cell
    
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as! TopicCellCollectionViewCell
        
        UIView.animate(withDuration: 0.2, delay: 0, options: .beginFromCurrentState) {
            cell.transform = CGAffineTransform.init(scaleX: 1.0, y: 1.0)
            cell.transform = CGAffineTransform.init(scaleX: 0.9, y: 0.9)
        } completion: { Bool in
            
            
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            _ = storyboard.instantiateViewController(withIdentifier: "learnVC") as! CardsDeckCollectionVC
            //let segue = UIStoryboardSegue.init(identifier: "learnSegue", source: self, destination: quizVC)
            self.performSegue(withIdentifier: "learnSegue", sender: nil)
            //self.present(quizVC, animated: true)
        }

        
        /*
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseInOut, animations: {
            cell.transform = CGAffineTransform.init(scaleX: 1.0, y: 1.0)
            cell.transform = CGAffineTransform.init(scaleX: 0.9, y: 0.9)
        })
        { bool in
            if cell.cellLabel.text == "Family" {
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            var quizVC = storyboard.instantiateViewController(withIdentifier: "learnVC") as! CardsDeckCollectionVC
            let segue = UIStoryboardSegue.init(identifier: "learnSegue", source: self, destination: quizVC)
            self.present(quizVC, animated: true)
            } else {
                self.performSegue(withIdentifier: "learnSegue", sender: nil)
            }
        }
         
         */
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
