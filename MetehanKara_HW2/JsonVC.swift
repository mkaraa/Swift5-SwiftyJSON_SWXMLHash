//
//  JsonVC.swift
//  MetehanKara_HW2
//
//  Created by Metehan kara on 22.04.2020.
//  Copyright © 2020 Metehan kara. All rights reserved.
//

import UIKit

class JsonVC: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    //MARK: IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: Variables
    let JSONDataSource = DataSource()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "dataJSON" {
            
            if let indexPath = getIndexPathForSelectedRow() {
                let fruit = JSONDataSource.itemsInCategory(index: indexPath.section)[indexPath.row]
                let controller = segue.destination as! DetailVC
                controller.fruit = fruit
            }
            
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return JSONDataSource.numberOfCategories()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return JSONDataSource.numbeOfItemsInEachCategory(index: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //var cell = UITableViewCell()
        
        // Recommended way
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell
        let fruits: [Record] = JSONDataSource.itemsInCategory(index: indexPath.section)
        let fruit = fruits[indexPath.row]
        cell.textLabel?.text = fruit.name
        cell.imageView?.image = UIImage(named: fruit.image.lowercased())
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40.0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0;//Choose your custom row height
    }
    
    // Setting the header title for each section
    /*
     func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
     
     return JSONDataSource.getCategoryLabelAtIndex(index: section)
     }
     */
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let label : UILabel = UILabel()
        
        label.text = JSONDataSource.getCategoryLabelAtIndex(index: section)
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 30.0)
        label.textAlignment = .center
        label.textColor = UIColor.red
        label.backgroundColor = UIColor(red: 1.00, green: 0.8, blue: 0.5, alpha: 1.00)
        
        return label
    }
    
    
    // Our function to have a reference to indexPath for the TableView
    func getIndexPathForSelectedRow() -> IndexPath? {
        var indexPath: IndexPath?
        
        if tableView.indexPathsForSelectedRows!.count > 0 {
            indexPath = tableView.indexPathsForSelectedRows![0] as IndexPath
        }
        
        return indexPath
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        JSONDataSource.populate(type: "json")
    }
    
    
}
