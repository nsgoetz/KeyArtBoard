//
//  KeyboardViewController.swift
//  KeyArtBoard
//
//  Created by Noah Goetz on 9/26/14.
//  Copyright (c) 2014 Noah Goetz. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {

    @IBOutlet var nextKeyboardButton: UIButton!
    var artButtons : [KeyArtButton] = [KeyboardButtonFactory.generateKeyArtButton(title: "title", text: "text", place: 0)]
    var textForButton : [String: String] = ["": ""];
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
    
        // Add custom view sizing constraints here
    }
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.drawNextKeyboardButton()
//        self.drawSomeButton()
////        self.view.backgroundColor = UIColor.whiteColor()
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for artButton in self.artButtons {
            self.drawNextButton(artButton)
        }
        self.drawNextKeyboardButton()
    }
    
    func drawNextButton(artButton: KeyArtButton) {
        var nextButton = artButton.button
        self.textForButton[artButton.title] = artButton.text
        nextButton.addTarget(self, action: Selector("insertArt:"),
            forControlEvents:UIControlEvents.TouchUpInside)
        self.view.addSubview(nextButton)
        var buttonCenterX = NSLayoutConstraint(item: nextButton, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.5, constant: 0.0)
        var buttonCenterY = NSLayoutConstraint(item: nextButton, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 1.0, constant: 0.0)
        self.view.addConstraints([buttonCenterX, buttonCenterY])
    }
    
    func insertArt(sender: UIButton) -> (){
        var proxy = self.textDocumentProxy as UITextDocumentProxy
        var text = self.textForButton[sender.titleLabel!.text!]
        proxy.insertText(text!)
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
        // Dispose of any resources that can be recreated
    }

    override func textWillChange(textInput: UITextInput) {
        // The app is about to change the document's contents. Perform any preparation here.
    }

    override func textDidChange(textInput: UITextInput) {
        // The app has just changed the document's contents, the document context has been updated.
    
        var textColor: UIColor
        var proxy = self.textDocumentProxy as UITextDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.Dark {
            textColor = UIColor.whiteColor()
        } else {
            textColor = UIColor.blackColor()
        }
        self.nextKeyboardButton.setTitleColor(textColor, forState: .Normal)
    }

}
