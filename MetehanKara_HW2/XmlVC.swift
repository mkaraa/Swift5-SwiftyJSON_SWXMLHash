//
//  XmlVC.swift
//  MetehanKara_HW2
//
//  Created by Metehan kara on 22.04.2020.
//  Copyright © 2020 Metehan kara. All rights reserved.
//

import UIKit

class XmlVC: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var mCollectionView: UICollectionView!
    //MARK: Variables
    let XMLDataSource = DataSource()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "dataXML" {
            
            if let indexPath = getIndexPathForSelectedCell() {
                let fruit = XMLDataSource.itemsInCategory(index: indexPath.section)[indexPath.row]
                let controller = segue.destination as! DetailVC
                controller.fruit = fruit
            }
        }
    }
    
    // Our function to find the indexPath of selected cell
    func getIndexPathForSelectedCell() -> IndexPath? {
        var indexPath: IndexPath?
        
        if mCollectionView.indexPathsForSelectedItems!.count > 0 {
            indexPath = mCollectionView.indexPathsForSelectedItems![0] as IndexPath
        }
        return indexPath
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return XMLDataSource.numbeOfItemsInEachCategory(index: section)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        //return mDataSource.groups.count
        return XMLDataSource.numberOfCategories()
        
    }
    
    // For each header setting the data
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as! CustomCollectionReusableView
        
        headerView.headerLabel.text = XMLDataSource.getCategoryLabelAtIndex(index: indexPath.section)
        headerView.backgroundColor = UIColor(red: 0.0, green: 0.8, blue: 0.8, alpha: 1.0)
        return headerView
    }
    
    // For each cell setting the data
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionViewCell
        
        let fruits: [Record] = XMLDataSource.itemsInCategory(index: indexPath.section)
        let fruit = fruits[indexPath.row]
        
        let name = fruit.name
        let image = fruit.image
        cell.cellImageView.image = UIImage(named: image)
        cell.cellLabel.text = name.capitalized
        cell.cellLabel.textAlignment = .center
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        XMLDataSource.populate(type: "xml")
    }
}
