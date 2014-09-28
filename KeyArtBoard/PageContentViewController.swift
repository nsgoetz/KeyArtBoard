//
//  PageContentViewController.swift
//  KeyArtBoardApp
//
//  Created by Noah Goetz on 9/28/14.
//  Copyright (c) 2014 Noah Goetz. All rights reserved.
//

import UIKit

class PageContentViewController: UIViewController {
    
    @IBOutlet var backgroundImageView : UIImageView!
    @IBOutlet var titleLabel : UILabel!
    
    var index : Int = 0
    var titleText : String = ""
    var imageFile : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.backgroundImageView.image = UIImage(named: self.imageFile)
//        self.titleLabel.text = self.titleText
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

