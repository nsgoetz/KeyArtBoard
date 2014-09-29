//
//  ContainerScrollViewController.swift
//  KeyArtBoardApp
//
//  Created by Noah Goetz on 9/28/14.
//  Copyright (c) 2014 Noah Goetz. All rights reserved.
//

import UIKit

class ContainerScrollViewController: UIInputViewController {
    
    @IBOutlet var nextKeyboardButton: UIButton!
    var colsPerPage :CGFloat =  4
    var rowsPerPage :CGFloat = 2
    var bottomMargin :CGFloat = 20
    var iconHeight :CGFloat = 95
    var iconWidth :CGFloat = 80
    var iconXSpace :CGFloat = 0
    var iconYSpace :CGFloat = 0
    var icons : [IconButton] = []

    var scrollView :IconScrollView? = nil
    var drawingButton :UIBarButtonItem?
    var datastore = DataStore()
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("frame")
        print(self.view.frame)
        print("height")
        print(self.iconHeight)
        var iconCount = self.datastore.numButtons();
        var totalWidth = (CGFloat(iconCount + 1) / self.rowsPerPage) * self.iconWidth
        self.scrollView = IconScrollView()
        self.scrollView!.frame = CGRect(x: 0, y:0, width: self.scrollView!.intrinsicContentSize().width, height: self.scrollView!.intrinsicContentSize().height)
        var wide = CGFloat(((iconCount + 1) / 2) + 1) * self.iconWidth
        self.scrollView!.contentSize = CGSize(width: wide, height: self.scrollView!.frame.height)
//        self.scrollView!.backgroundColor = UIColor.redColor()
        self.icons = makeButtonsForCount(iconCount)
        self.drawNextKeyboardButton()
        // Do any additional setup after loading the view.
        
        self.drawingButton = UIBarButtonItem(barButtonSystemItem: .Compose, target:self, action: "")
//        self.view.addSubview(self.drawingButton)
        
//        var plusconstraints = NSLayoutConstraint(item: self.drawingButton, attribute: .bottom, relatedBy: .Equal, toItem: self.view, attribute: .Top, multiplier: 1, constant: y)
        
        self.view.addSubview(scrollView!)   
    }
    
    func makeButtonsForCount(count : Int) -> [IconButton] {
        var buttons : [IconButton] = [];
        
        for (var i = 0; i < count; i++){
            var y = CGFloat(i % 2) * self.iconHeight
            var x = (CGFloat(i / 2) * self.iconWidth)
            var button = KeyboardButtonFactory.generateFixedKeyArtButton(title: "", text: self.datastore.stringForButtonAtIndex(i), width: self.iconWidth, height: self.iconHeight).button
            button.setBackgroundImage(self.datastore.imageForButtonAtIndex(i), forState: .Normal)
            button.frame = CGRect(x:0,y:0,width:self.iconWidth,height:self.iconWidth)
            button.layer.cornerRadius = 10
            var constr1 = NSLayoutConstraint(item: button, attribute: .Left, relatedBy: .Equal, toItem: self.scrollView!, attribute: .Left, multiplier: 1, constant: x);
            var constr2 = NSLayoutConstraint(item: button, attribute: .Top, relatedBy: .Equal, toItem: self.scrollView!, attribute: .Top, multiplier: 1, constant: y);
            self.scrollView!.addSubview(button)
            self.scrollView!.addConstraints([constr1, constr2])
//            button.backgroundColor = [UIColor.blackColor(), UIColor.blueColor(), UIColor.greenColor()][i % 3]
            button.userInteractionEnabled = false
            buttons += [button]
        }
        return buttons
    }
    
    func drawNextKeyboardButton() {
        // Perform custom UI setup here
        self.nextKeyboardButton = UIButton.buttonWithType(.System) as UIButton
        
        self.nextKeyboardButton.setTitle(NSLocalizedString("🌐", comment: "Title for 'Next Keyboard' button"), forState: .Normal)
        
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        self.nextKeyboardButton.addTarget(self, action: "advanceToNextInputMode", forControlEvents: .TouchUpInside)
        
        self.view.addSubview(self.nextKeyboardButton)
        
        var nextKeyboardButtonLeftSideConstraint = NSLayoutConstraint(item: self.nextKeyboardButton, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1.0, constant: 0.0)
        var nextKeyboardButtonBottomConstraint = NSLayoutConstraint(item: self.nextKeyboardButton, attribute: .Bottom, relatedBy: .Equal, toItem: self.view, attribute: .Bottom, multiplier: 1.0, constant: 0.0)
        self.view.addConstraints([nextKeyboardButtonLeftSideConstraint, nextKeyboardButtonBottomConstraint])
        
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

}
