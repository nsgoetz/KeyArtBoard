//
//  NamingVC.swift
//  KeyArtBoardApp
//
//  Created by Eric on 9/27/14.
//  Copyright (c) 2014 Noah Goetz. All rights reserved.
//

import UIKit

class NamingVC: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func sharePressed() {
        let W = Pixel.White
        let B = Pixel.Black
        let test2 = [[W, W, W, W, B, B, B, B, W, W],
            [W,W,W, B, B, B,B,B,B,W],
            [W,W,B,B,B,B,B,B,B,B,B,W],
            [W,B,B,W,W,W,B,B,B,B],
            [W,B,B,B,W,B,B,
                B,B,B],
            [B,B,B,B,B,B,B,B,B,B]]
        var testString : String = toASCII(scaleDown(test2, 2, threshold: 0.25), false)
        let controller = UIActivityViewController(activityItems: [testString], applicationActivities: nil)
        navigationController?.presentViewController(controller, animated: true, completion: nil)
    }
    
    @IBAction func cancel(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func saveUnwind(sender: AnyObject) {
            dismissViewControllerAnimated(true, completion: nil)
        
        }

    
}
