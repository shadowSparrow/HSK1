//
//  MainMenuViewController.swift
//  HSK1
//
//  Created by mac on 28.06.2022.
//

import UIKit

class MainMenuViewController: UICollectionViewController {

    let menuItems = MenuItem.getItems()
    
    private let edgeInsets = UIEdgeInsets(top: 56, left: 35, bottom: 56, right: 35)
    private let interLineSpacing = 10
    private let screenWindh = UIScreen.main.bounds.width
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Menu"
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
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
        cell.imageView.layer.borderWidth = 1.0
        cell.imageView.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        cell.imageView.layer.cornerRadius = 20
        return cell
    }

    
    // MARK: UICollectionViewDelegate

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath)
        UIView.animate(withDuration: 0.4, delay: 0, options: .autoreverse, animations: {
            cell?.transform = CGAffineTransform.init(scaleX: 0.7, y: 0.7)
            cell?.transform = CGAffineTransform.init(scaleX: 1, y: 1)
        }) { bool in
            self.performSegue(withIdentifier: "segue", sender: nil)
        }
 
        
    }
    
    
    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}

extension MainMenuViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        edgeInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWindh = screenWindh - 2*CGFloat(edgeInsets.right)
        return CGSize(width: itemWindh, height: itemWindh)
    }
}
