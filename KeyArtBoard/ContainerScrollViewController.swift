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
    var iconHeight :CGFloat = 20
    var iconWidth :CGFloat = 20
    var iconXSpace :CGFloat = 0
    var iconYSpace :CGFloat = 0
    var icons : [UIButton] = []
    var scrollView :IconScrollView? = nil
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.view.frame = CGRect(x: 50, y: 50,width: 300, height: 200)
        self.iconHeight = CGFloat(self.view.frame.height) / CGFloat(self.rowsPerPage)
        self.iconWidth = CGFloat(self.view.frame.width) / CGFloat(self.colsPerPage)
        print("frame")
        print(self.view.frame)
        print("height")
        print(self.iconHeight)
        var iconCount = 3;
        var totalWidth = (CGFloat(iconCount + 1) / self.rowsPerPage) * self.iconWidth
        self.scrollView = IconScrollView()
        self.scrollView!.backgroundColor = UIColor.redColor()
        self.icons = makeButtonsForCount(3)
        self.drawNextKeyboardButton()
        // Do any additional setup after loading the view.
        self.view.addSubview(scrollView!)   
    }
    
    func makeButtonsForCount(count : Int) -> [UIButton] {
        var buttons : [UIButton] = [];
        
        for (var i = 0; i < count; i++){
            var y = CGFloat(i % 2) * self.iconHeight
            var x = CGFloat(i / 2) * self.iconWidth
            var button = KeyboardButtonFactory.generateFixedKeyArtButton(title: String(i), text: String(i), x: x, y: y, width: self.iconWidth, height: self.iconHeight).button
            button.backgroundColor = [UIColor.blackColor(), UIColor.blueColor(), UIColor.greenColor()][i % 3]
            self.scrollView!.addSubview(button)
            buttons += [button]
        }
        return buttons
    }
    
    func drawNextKeyboardButton() {
        // Perform custom UI setup here
        self.nextKeyboardButton = UIButton.buttonWithType(.System) as UIButton
        
        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), forState: .Normal)
        
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
