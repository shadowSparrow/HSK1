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
    //private var isHidded:Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.collectionView.isHidden = isHidded
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
        var isLandskaped = UIDevice.current.orientation.isLandscape
        
        if isLandskaped {
            for cell in collectionView.visibleCells {
                cell.contentView.layer.backgroundColor = UIColor.blue.cgColor
                interLineSpacing = 0
                
                
            }
        } else {
            for cell in collectionView.visibleCells {
                cell.contentView.layer.backgroundColor = UIColor.purple.cgColor
                interLineSpacing = 5
                
            }
        }
        
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
extension MainMenuViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        edgeInsets
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        CGFloat(interLineSpacing)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var itemWindth: CGFloat = 0
        var itemHeight: CGFloat = 0
        
        if UIDevice.current.orientation.isLandscape {
            itemWindth = screenWindh/2
            itemHeight = screeHeight/2
        } else {
            itemWindth = screenWindh - CGFloat(2*edgeInsets.right)
            itemHeight = screeHeight/4
        }
        return CGSize(width: itemWindth, height: itemHeight)
        
    }
}
