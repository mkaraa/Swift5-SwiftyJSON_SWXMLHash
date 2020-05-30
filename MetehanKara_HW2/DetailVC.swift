//
//  DetailVC.swift
//  MetehanKara_HW2
//
//  Created by Metehan kara on 24.04.2020.
//  Copyright © 2020 Metehan kara. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
   
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    
    var fruit: Record?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let tempFruit = fruit {
            
            self.title = tempFruit.name
            imageView.image = UIImage(named: tempFruit.image)
            textView.text = tempFruit.description
            
        }
        
    }
    
}
