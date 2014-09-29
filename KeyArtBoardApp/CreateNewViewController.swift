//
//  CreateNewViewController.swift
//  KeyArtBoardApp
//
//  Created by Eric on 9/27/14.
//  Copyright (c) 2014 Noah Goetz. All rights reserved.
//

import UIKit

class CreateNewViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "plusSegue" {
            let layer = self.view.layer
            let scale = UIScreen.mainScreen().scale
            UIGraphicsBeginImageContextWithOptions(layer.frame.size, false, scale);
            
            layer.renderInContext(UIGraphicsGetCurrentContext())
            let screenshot = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            var pixelArray = imageToArray(screenshot)
            var asciiArt = toASCII(scaleDown(pixelArray, 5, threshold: 0.25), false)
            var NC = segue.destinationViewController as UINavigationController
            var VC = NC.topViewController as NamingVC
            UIImageWriteToSavedPhotosAlbum(screenshot, nil, nil, nil)
            VC.ascii = asciiArt
            VC.pic = screenshot
            
            
            
            
    }
}
}
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


