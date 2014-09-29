//
//  DataStore.swift
//  KeyArtBoardApp
//
//  Created by Mitchell Plamann on 9/28/14.
//  Copyright (c) 2014 Noah Goetz. All rights reserved.
//

import UIKit

class DataStore {
    let ud = NSUserDefaults(suiteName: "edu.cmu.98222.Shared")
    
    let texts = "buttonTexts"
    let images = "buttonImages"
    
    init() {
        if ud.objectForKey("buttonImages") == nil {
            ud.setObject([] as [UIImage], forKey: images)
            ud.setObject([] as [NSString], forKey: texts)
        }
    }
    
    func addButton(image:UIImage, text:NSString) {
        var currentImages = ud.objectForKey(images) as [NSData]
        var currentTexts = ud.objectForKey(texts) as [NSString]
        currentImages.append(UIImagePNGRepresentation(image))
        currentTexts.append(text)
        ud.setObject(currentImages, forKey: images)
        ud.setObject(currentTexts, forKey:texts)
        ud.synchronize()
    }
    
    func stringForButtonAtIndex(index: Int) -> NSString {
        let array = ud.objectForKey(texts) as [NSString]
        return array[index]
    }
    
    func numButtons() -> Int {
        let array = ud.objectForKey(texts) as [NSString]
        return array.count
    }
    
    func imageForButtonAtIndex(index: Int) -> UIImage {
        let array = ud.objectForKey(images) as [NSData]
        return UIImage(data: array[index])
    }
}
