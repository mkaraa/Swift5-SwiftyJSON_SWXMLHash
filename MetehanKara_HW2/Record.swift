//
//  Record.swift
//  CTIS480_Spring1920_HW2
//
//  Created by Syed Ali on 4/22/20.
//  Copyright © 2020 CTIS. All rights reserved.
//

import Foundation

class Record {
    var name: String
    var category: String
    var description: String
    var image: String
    
    init(name: String, category: String, description: String, image: String) {
        self.category = category
        self.name = name
        self.description = description
        self.image = image
    }
        
}
