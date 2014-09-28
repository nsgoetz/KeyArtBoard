//
//  KeyboardButtonFactory.swift
//  KeyArtBoardApp
//
//  Created by Noah Goetz on 9/26/14.
//  Copyright (c) 2014 Noah Goetz. All rights reserved.
//

import UIKit

struct KeyArtButton {
    var title: NSString;
    var text: NSString;
    var button: UIButton;
    var place: Int;
}

class KeyboardButtonFactory: NSObject {
    class func generateButton(#title: String, art: String) -> UIButton {
        var button = UIButton.buttonWithType(.System) as UIButton
        button.setTitle(title, forState: .Normal)
        button.sizeToFit()
        button.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        //        button.titleLabel!.font = UIFont.systemFontOfSize(32)
        button.backgroundColor = UIColor(white: 1.0, alpha: 0.25)
        return button
    }
    
    class func generateKeyArtButton(#title: String, text: String, place: Int) -> KeyArtButton {
        var button = UIButton.buttonWithType(.System) as UIButton
        button.setTitle(title, forState: .Normal)
        button.sizeToFit()
        button.setTranslatesAutoresizingMaskIntoConstraints(false)
        
//        button.titleLabel!.font = UIFont.systemFontOfSize(32)
        button.backgroundColor = UIColor(white: 1.0, alpha: 0.25)
        var artButton = KeyArtButton(title: title, text: text, button: button, place: place)
        return artButton
    }
    
    
}
