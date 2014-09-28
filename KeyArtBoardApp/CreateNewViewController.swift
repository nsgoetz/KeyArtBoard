//
//  CreateNewViewController.swift
//  KeyArtBoardApp
//
//  Created by Eric on 9/27/14.
//  Copyright (c) 2014 Noah Goetz. All rights reserved.
//

import UIKit

class CreateNewViewController: UIViewController {
    
    @IBOutlet var drawView : DrawView?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clearTapped() {
        var theDrawView = drawView as DrawView!
        theDrawView.lines = []
        theDrawView.setNeedsDisplay()
        
    }
    
    @IBAction func plusTapped() {
        var canvas = drawView as DrawView!
        //UIGraphicsBeginImageContextWithOptions(canvas.bounds.size, false, 0.0)
        //var context = UIGraphicsGetCurrentContext()

        var SaveImage: UIImage = canvas.image!
        UIImageWriteToSavedPhotosAlbum(SaveImage, self, Selector("image:didFinishSavingWithError:contextInfo:"), nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
