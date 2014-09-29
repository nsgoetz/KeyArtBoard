//
//  NamingVC.swift
//  KeyArtBoardApp
//
//  Created by Eric on 9/27/14.
//  Copyright (c) 2014 Noah Goetz. All rights reserved.
//

import UIKit


class NamingVC: UIViewController {
    
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var asciiText: UITextView!
    var pic :String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        asciiText.text = pic
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
        
        let controller = UIActivityViewController(activityItems: [returnStr()], applicationActivities: nil)
        navigationController?.presentViewController(controller, animated: true, completion: nil)
    }
    
    @IBAction func cancel(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func saveUnwind(sender: AnyObject) {
    //DataStore().addButton(pic, text: <#NSString#>)
            dismissViewControllerAnimated(true, completion: nil)
        
        }

    
}
