//
//  DataSource.swift
//  CTIS480_Spring1920_HW2
//
//  Created by Syed Ali on 4/22/20.
//  Copyright © 2020 CTIS. All rights reserved.
//

import Foundation

class DataSource {
    var mRecordList: [Record] = []
    var categories: [String] = []
    
    func numbeOfItemsInEachCategory(index: Int) -> Int {
        return itemsInCategory(index: index).count
    }
    
    func numberOfCategories() -> Int {
        return categories.count
    }
    
    func getCategoryLabelAtIndex(index: Int) -> String {
        return categories[index]
    }
    
    // MARK:- Populate Data from files
    
    func populate(type: String) {
        
        if type.lowercased() == "json" {
            if let path = Bundle.main.path(forResource: "hw2", ofType: "json") {
                if let jsonToParse = NSData(contentsOfFile: path) {
                    
                    // https://www.dotnetperls.com/guard-swift
                    guard let json = try? JSON(data: jsonToParse as Data) else {
                        print("Error with JSON")
                        return
                    }
                    //print(json)
                    
                    let total = json["items"].count
                    print(total)
                    
                    for index in 0..<total {
                        
                        let category = json["items"][index]["category"].string!
                        let name = json["items"][index]["name"].string!
                        let images = json["items"][index]["image"].string!
                        let description = json["items"][index]["description"].string!
                        
                        print(category)
                        print(name)
                        print(description)
                        print(images)
                        print("\n")
                        
                        let record = Record(name: name, category: category, description: description, image: images)
                        if !categories.contains(category){
                            categories.append(category)
                        }
                        mRecordList.append(record)
                        
                    }
                    
                }
                else {
                    print("NSData error")
                }
            }
            else {
                print("Path error")
            }
        }
        else {
            if let path = Bundle.main.path(forResource: "hw2", ofType: "xml") {
                if let xmlToParse = NSData(contentsOfFile: path) {
                    
                    let xml = SWXMLHash.parse(xmlToParse as Data)
                    //print(xml)
                    
                    let total = xml["main"]["item"].all.count
                    
                    for index in 0..<total {
                        let category = xml["main"]["item"][index]["category"].element?.text
                        let name = xml["main"]["item"][index]["name"].element?.text
                        let description = xml["main"]["item"][index]["description"].element?.text
                        let image = xml["main"]["item"][index]["image"].element?.text
                        
                        
                        let record = Record(name: name!, category: category!, description: description!, image: image!)
                        if !categories.contains(category!) {
                            categories.append(category!)
                        }
                        mRecordList.append(record)
                    }
                    
                }
                else {
                    print("NSData error")
                }
            }
            else {
                print("Path error")
            }
        }
    }
    
    // MARK:- itemsForEachGroup
    func itemsInCategory(index: Int) -> [Record] {
        let item = categories[index]
        
        // See playground6 for Closure
        // http://locomoviles.com/uncategorized/filtering-swift-array-dictionaries-object-property/
        
        let filteredItems = mRecordList.filter { (record: Record) -> Bool in
            return record.category == item
        }
        
        return filteredItems
    }
    
}
